class Category < ActiveRecord::Base
  has_many :items
  accepts_nested_attributes_for :items
  attr_accessible :name, :items_attributes

  validates :name, :presence => true
end
