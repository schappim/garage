class Vehicle < ActiveRecord::Base
  attr_accessible :make, :model, :plate, :vehicle_type_id, :year
  belongs_to :vehicle_type
  has_many :repairs

  def display_name
    self.plate 
  end
end
