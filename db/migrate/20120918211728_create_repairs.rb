class CreateRepairs < ActiveRecord::Migration
  def change
    create_table :repairs do |t|
      t.string :invoice
      t.decimal :cost, :precision => 8, :scale => 2
      t.text :description
      t.date :repaired_on
      t.references :vehicle

      t.timestamps
    end
    add_index :repairs, :vehicle_id
  end
end
