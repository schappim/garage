class RepairPart < ActiveRecord::Base
  belongs_to :item
  belongs_to :repair

  attr_accessible :units, :item_id, :repair_id

  before_validation :check_units
  validates :units, :item_id, :repair_id, :presence => true
  validates :units, :numericality => { :greater_than => 0 }

  after_save :update_item_units

  protected
  def check_units
    unless item_id.nil? or units.nil?
      errors.add(:units, "cannot exceed the total units of the item (#{self.item.units})") if units > self.item.units
    end
  end

  def update_item_units
    self.item.units -= units
    self.item.save
  end
end
