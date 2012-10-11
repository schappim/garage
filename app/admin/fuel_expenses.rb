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
      li "Expenses: "+fuel_expenses.count.to_s
      li "Costs: "+number_to_currency(fuel_expenses.sum(:cost), :unit => "CHF", :format => '%u %n')
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
