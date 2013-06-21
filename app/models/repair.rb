class Repair < ActiveRecord::Base
  attr_accessible :cost, :description, :invoice, :repaired_on, :vehicle_id, :kms, :hours
  belongs_to :vehicle

  validates :cost, :invoice, :repaired_on, :vehicle_id, :kms, :hours, :presence => true

  scope :last_6_months, where("repaired_on >= ?", 6.month.ago)

  def self.graph
    Hash[ :name => "Repairs",
      :data => Hash[last_6_months.group_by_month(:repaired_on).order("month asc").sum(:cost).map {|k, v| [Date.strptime(k).strftime("%b %Y"), v]}]
    ]
  end
end
