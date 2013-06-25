class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.decimal :cost_per_unit
      t.decimal :total_cost
      t.integer :units
      t.references :item

      t.timestamps
    end
    add_index :purchases, :item_id
  end
end
