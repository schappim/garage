class AddHoursAndKmsToRepairs < ActiveRecord::Migration
  def change
    add_column :repairs, :hours, :decimal, :precision => 8, :scale => 2
    add_column :repairs, :kms, :decimal, :precision => 8, :scale => 2
  end
end
