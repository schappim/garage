ActiveAdmin.register Vehicle do

  config.sort_order = "plate_asc"
  index  do
    column :plate do |vehicle|
      link_to vehicle.plate, admin_vehicle_path(vehicle)
    end
    column :vehicle_type
    column :make
    column :model
    column :year
    default_actions
  end
  # Filter only by title
  filter :vehicle_type
  filter :make
  filter :model
  filter :year

  
end
