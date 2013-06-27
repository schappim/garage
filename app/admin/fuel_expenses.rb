ActiveAdmin.register FuelExpense do

  menu :parent => "Vehicles"
  
  config.sort_order = "fueled_on_desc"
  index  do
    column :invoice do |fuel_expense|
      link_to fuel_expense.invoice, admin_fuel_expense_path(fuel_expense)
    end
    column :cost do |fuel_expense|
      number_to_currency(fuel_expense.cost, :unit => "CHF", :format => '%u %n')
    end
    column :km
    column :liters
    column :fueled_on
    column :vehicle
    default_actions

    panel "Totals" do
      li do
        label "Registries:", :style => "display: inline-block;"
        div FuelExpense.search(params['q']).count, :class => "total_registries", :style => "display: inline-block;"
      end
      li do 
        label "Costs:", :style => "display: inline-block;"
        div number_to_currency(FuelExpense.search(params['q']).sum(:cost), :unit => "CHF", :format => '%u %n'), :class => "total_costs", :style => "display: inline-block;"
      end
    end
  end

  show do |fuel_expense|
    attributes_table do
      row :id
      row :invoice
      row :cost do |v|
        number_to_currency(v.cost, :unit => "CHF", :format => '%u %n')
      end
      row :liters
      row :km
      row :fueled_on
      row :vehicle
    end

    active_admin_comments
  end

  # Filter only by title
  filter :vehicle
  filter :invoice
  filter :fueled_on
  filter :cost
  filter :km
  filter :liters

end
