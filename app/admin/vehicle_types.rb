ActiveAdmin.register VehicleType do

  menu :label => "Types", :parent => "Vehicles"

  config.sort_order = "name_asc"
  index  do
    column :name do |vehicle_type|
      link_to vehicle_type.name, admin_vehicle_type_path(vehicle_type)
    end
    default_actions
  end

  show do |vehicle_type|
    attributes_table do
      row :id
      row :name
    end

    columns do
      column do
        panel "Vehicles" do
          table_for vehicle_type.vehicles do |vehicle|
            column :plate
            column :make
            column :model
            column :fuel_expenses do |v|
              number_to_currency(v.total_fuel_expenses, :unit => "CHF", :format => '%u %n')
            end
            column :repairs do |v|
              number_to_currency(v.total_repairs, :unit => "CHF", :format => '%u %n')
            end
          end
        end
      end
    end
  end
  # Filter only by title
  filter :name
end
