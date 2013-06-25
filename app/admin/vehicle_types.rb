ActiveAdmin.register VehicleType do

  menu :label => "Types", :parent => "Vehicles"

  config.sort_order = "name_asc"
  index  do
    column :name do |vehicle_type|
      link_to vehicle_type.name, admin_vehicle_type_path(vehicle_type)
    end
    default_actions
  end
  # Filter only by title
  filter :name
end
