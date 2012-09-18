class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.string :plate
      t.references :vehicle_type

      t.timestamps
    end
  end
end
