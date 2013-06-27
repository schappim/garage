class AddKmsToVehicle < ActiveRecord::Migration
  def change
    add_column :vehicles, :kms, :integer
  end
end
