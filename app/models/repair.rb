class Repair < ActiveRecord::Base
  attr_accessible :cost, :description, :invoice, :repaired_on, :vehicle_id
  belongs_to :vehicle

end
