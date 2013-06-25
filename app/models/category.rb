class Category < ActiveRecord::Base
  has_many :items
  attr_accessible :name

  validates :name, :presence => true
end
