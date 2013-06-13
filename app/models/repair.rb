class Repair < ActiveRecord::Base
  attr_accessible :cost, :description, :invoice, :repaired_on, :vehicle_id, :kms, :hours
  belongs_to :vehicle

  validates :cost, :invoice, :repaired_on, :vehicle_id, :kms, :hours, :presence => true

end
