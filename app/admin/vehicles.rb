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
