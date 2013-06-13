ActiveAdmin.register FuelExpense do
  
  config.sort_order = "fueled_on_desc"
  index  do
    column :invoice do |fuel_expense|
      link_to fuel_expense.invoice, admin_fuel_expense_path(fuel_expense)
    end
    column :cost
    column :km
    column :liters
    column :fueled_on
    column :vehicle
    default_actions

    panel "Totals" do
      li do
        label "Registries:", :style => "display: inline-block;"
        div FuelExpense.search(params['q']).count, :class => "fuel_expenses_qty", :style => "display: inline-block;"
      end
      li do 
        label "Costs:", :style => "display: inline-block;"
        div number_to_currency(FuelExpense.search(params['q']).sum(:cost), :unit => "CHF", :format => '%u %n'), :class => "fuel_expenses_totals", :style => "display: inline-block;"
      end
    end
  end

  # Filter only by title
  filter :vehicle
  filter :invoice
  filter :fueled_on
  filter :cost
  filter :km
  filter :liters

end
