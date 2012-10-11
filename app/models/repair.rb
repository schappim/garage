class Repair < ActiveRecord::Base
  attr_accessible :cost, :description, :invoice, :repaired_on, :vehicle_id
  belongs_to :vehicle

  validates :invoice, :cost, :repaired_on, :vehicle_id, :presence => true

end
