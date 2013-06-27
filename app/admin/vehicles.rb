ActiveAdmin.register Vehicle do

  menu :label => "List", :parent => "Vehicles"

  config.sort_order = "plate_asc"
  index  do
    column :plate do |vehicle|
      link_to vehicle.plate, admin_vehicle_path(vehicle)
    end
    column :vehicle_type, :required => true 
    column :make
    column :model
    column :year do |vehicle|
        DateTime.parse(vehicle.year.to_s).strftime("%Y") unless vehicle.year.nil?
    end
    column :fuel_expenses do |v|
      number_to_currency(v.total_fuel_expenses, :unit => "CHF", :format => '%u %n')
    end
    column :repairs do |v|
      number_to_currency(v.total_repairs, :unit => "CHF", :format => '%u %n')
    end
    default_actions
  end

  show do |v|
    attributes_table do
      row :plate
      row :make
      row :model
      row :year do
        v.year.nil? ? "" : DateTime.parse(v.year.to_s).strftime("%Y")
      end
      row :vehicle_type
      row "Total Fuel Expenses" do
        span number_to_currency(v.total_fuel_expenses, :unit => "CHF", :format => '%u %n'), :id => :total_fuel_expenses
      end
      row "Total Repairs" do
        span number_to_currency(v.total_repairs, :unit => "CHF", :format => '%u %n'), :id => :total_repairs
      end
    end

      columns do
        column do
          panel "Last 10 Fuel Expenses" do
            table_for v.fuel_expenses.limit(10)  do 
              column :fueled_on 
              column :cost do |fuel_expense|
                number_to_currency(fuel_expense.cost, :unit => "CHF", :format => '%u %n')
              end
              column :invoice do |fuel_expense|
                link_to fuel_expense.invoice, admin_fuel_expense_path(fuel_expense)
              end
              column :km
              column :liters
            end
          end
        end
        column do
          panel "Last 10 Repairs" do
            table_for v.repairs.limit(10)  do 
              column :repaired_on 
              column :cost do |repair|
                number_to_currency(repair.cost, :unit => "CHF", :format => '%u %n')
              end
              column :invoice do |repair|
                link_to repair.invoice, admin_repair_path(repair)
              end
              column :kms
              column :hours
            end
          end
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
