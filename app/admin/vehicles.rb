ActiveAdmin.register Vehicle do

  config.sort_order = "plate_asc"
  index  do
    column :plate do |vehicle|
      link_to vehicle.plate, admin_vehicle_path(vehicle)
    end
    column :vehicle_type, :required => true 
    column :make
    column :model
    column :year,
    default_actions
  end

  show do |v|
    attributes_table do
      row :make
      row :model
      row :plate
      row :vehicle_type
      row "Total Fuel Expenses" do
        span number_to_currency(v.total_fuel_expenses, :unit => "CHF", :format => '%u %n'), :id => :total_fuel_expenses
      end
      row "Total Repairs" do
        span number_to_currency(v.total_repairs, :unit => "CHF", :format => '%u %n'), :id => :total_repairs
      end
    end

  end

  form do |f|
    f.inputs "Vehicle" do
      f.input :vehicle_type, :required => true 
      f.input :make
      f.input :model
      f.input :plate
      f.input :year, :start_year => 1980, :end_year => Date.today.year
    end
    f.actions
  end
  # Filter only by title
  filter :vehicle_type
  filter :make
  filter :model
  filter :year

  
end
