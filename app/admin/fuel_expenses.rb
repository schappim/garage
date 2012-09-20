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
  end
  # Filter only by title
  filter :vehicle
  filter :invoice
  filter :fueled_on
  filter :cost
  filter :km
  filter :liters
end
