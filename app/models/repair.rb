class Repair < ActiveRecord::Base
  belongs_to :vehicle
  has_many :repair_parts
  accepts_nested_attributes_for :repair_parts

  attr_accessible :cost, :description, :invoice, :repaired_on, :vehicle_id, :kms, :hours, :repair_parts_attributes

  validates :cost, :invoice, :repaired_on, :vehicle_id, :kms, :hours, :presence => true

  scope :last_6_months, where("repaired_on >= ?", 6.month.ago)

  def self.graph
    Hash[ :name => "Repairs",
      :data => Hash[last_6_months.group_by_month(:repaired_on).order("month asc").sum(:cost).map {|k, v| [Date.strptime(k).strftime("%b %Y"), v]}]
    ]
  end
end
