class VehicleType < ActiveRecord::Base
  attr_accessible :name
  has_many :vehicles

  validates :name, :presence => true
end
