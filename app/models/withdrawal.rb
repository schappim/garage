class Withdrawal < ActiveRecord::Base
  belongs_to :item
  attr_accessible :reason, :units, :item_id

  before_validation :check_units
  validates :reason, :units, :item_id, :presence => true
  validates :units, :numericality => { :greater_than => 0 }

  after_save :update_item_units

  protected
  def check_units
    unless item_id.nil? or units.nil?
      errors.add(:units, "cannot exceed the total units of the item (#{self.item.units})") if units > self.item.units
    end
  end

  def update_item_units
    self.item.units -= self.units 
    self.item.save
  end
end
