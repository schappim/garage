class AddUnitsToItems < ActiveRecord::Migration
  def change
    add_column :items, :units, :integer
  end
end
