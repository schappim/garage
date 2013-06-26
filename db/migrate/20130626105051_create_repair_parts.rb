class CreateRepairParts < ActiveRecord::Migration
  def change
    create_table :repair_parts do |t|
      t.integer :units
      t.references :item
      t.references :repair

      t.timestamps
    end
    add_index :repair_parts, :item_id
    add_index :repair_parts, :repair_id
  end
end
