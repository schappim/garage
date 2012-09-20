class CreateFuelExpenses < ActiveRecord::Migration
  def change
    create_table :fuel_expenses do |t|
      t.string :invoice
      t.decimal :cost, :precision => 8, :scale => 2
      t.decimal :liters, :precision => 8, :scale => 2
      t.decimal :km, :precision => 8, :scale => 2
      t.date :fueled_on
      t.references :vehicle

      t.timestamps
    end
    add_index :fuel_expenses, :vehicle_id
  end
end
