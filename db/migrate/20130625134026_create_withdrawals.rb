class CreateWithdrawals < ActiveRecord::Migration
  def change
    create_table :withdrawals do |t|
      t.integer :units
      t.text :reason
      t.references :item

      t.timestamps
    end
    add_index :withdrawals, :item_id
  end
end
