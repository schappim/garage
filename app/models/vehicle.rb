class Vehicle < ActiveRecord::Base
  attr_accessible :make, :model, :plate, :vehicle_type_id, :year, :kms
  belongs_to :vehicle_type
  has_many :repairs
  has_many :fuel_expenses

  validates :make, :model, :plate, :vehicle_type_id, :year, :kms, :presence => true
  validates :kms, :numericality => { :greater_than => 0 }

  def total_fuel_expenses
    self.fuel_expenses.sum(:cost)
  end

  def total_repairs
    self.repairs.sum(:cost)
  end

  def display_name
    self.plate 
  end
end
