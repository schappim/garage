class Item < ActiveRecord::Base
  belongs_to :category
  has_many :purchases
  has_many :withdrawals
  attr_accessible :brand, :name, :category_id, :units

  validates :brand, :name, :category_id, :units, :presence => true
  validates :units, :numericality => { :greater_than_or_equal_to => 0 }
end
