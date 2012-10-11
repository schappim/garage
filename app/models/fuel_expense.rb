class FuelExpense < ActiveRecord::Base
  belongs_to :vehicle
  attr_accessible :cost, :fueled_on, :invoice, :km, :liters, :vehicle_id

  validates :cost, :vehicle_id, :invoice, :fueled_on, :presence => true
end
