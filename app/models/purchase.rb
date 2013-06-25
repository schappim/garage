class Purchase < ActiveRecord::Base
  belongs_to :item
  attr_accessible :cost_per_unit, :total_cost, :item_id, :units

  before_validation :balance_costs
  validates :cost_per_unit, :total_cost, :units, :item_id, :presence => true
  after_save :update_item_units

 
  protected
  def balance_costs

      if cost_per_unit.nil?
        self.cost_per_unit = (total_cost / units) unless total_cost.nil? or units.nil?
      end

      if total_cost.nil?
        self.total_cost = (cost_per_unit * units) unless cost_per_unit.nil? or units.nil?
      end

      if !cost_per_unit.nil? and !units.nil? and !total_cost.nil?
        unless (cost_per_unit * units) == total_cost
          errors.add(:cost_per_unit, "and total cost don't match")
        end
      end

  end

  def update_item_units
    self.item.units += units 
    self.item.save
  end
end
