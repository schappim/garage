class Item < ActiveRecord::Base
  belongs_to :category
  attr_accessible :brand, :name, :category_id

  validates :brand, :name, :category_id, :presence => true
end
