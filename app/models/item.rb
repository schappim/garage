class Item < ActiveRecord::Base
  belongs_to :category
  has_many :purchases
  has_many :withdrawals
  has_many :repair_parts

  attr_accessible :brand, :name, :category_id, :units

  validates :brand, :name, :category_id, :units, :presence => true
  validates :units, :numericality => { :greater_than_or_equal_to => 0 }

  scope :available, where("units > ?", 0)

  def sku
    "#{sprintf("%03d",self.category.id)}.#{sprintf("%04d",id)}"
  end

  def avg_price
    unless self.purchases.empty?
      (self.purchases.sum(:total_cost) / self.purchases.sum(:units) )
    else
      0
    end
  end
end
