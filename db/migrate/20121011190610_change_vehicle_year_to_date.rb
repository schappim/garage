class ChangeVehicleYearToDate < ActiveRecord::Migration
  def up
    change_table :vehicles do |t|
      t.remove :year
      t.date :year
    end
  end

  def down
    change_table :vehicles do |t|
      t.remove :year 
      t.integer :year
    end
  end
end
