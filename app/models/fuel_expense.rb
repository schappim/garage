class FuelExpense < ActiveRecord::Base
  belongs_to :vehicle
  attr_accessible :cost, :fueled_on, :invoice, :km, :liters, :vehicle_id

  validates :cost, :fueled_on, :invoice, :km, :liters, :vehicle_id, :presence => true
  validates :cost, :km, :numericality => { :greater_than => 0 }
  validates :liters, :numericality => { :greater_than_or_equal_to => 0 }

  after_save :update_vehicle

  scope :last_6_months, where("fueled_on >= ?", 6.month.ago)

  def self.graph
    Hash[ :name => "Fuel Expenses",
      :data => Hash[last_6_months.group_by_month(:fueled_on).order("month asc").sum(:cost).map {|k, v| [Date.strptime(k).strftime("%b %Y"), v]}]
    ]
  end

  protected
  def update_vehicle
    self.vehicle.kms = km
  end

end
