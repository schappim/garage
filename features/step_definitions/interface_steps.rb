When(/^I go to the new vehicle page$/) do
  visit "/admin/vehicles/new"
end

When(/^I go to a vehicle page$/) do
  @vehicle = FactoryGirl.create(:vehicle)
  100.times do
    FactoryGirl.create(:fuel_expense, :vehicle => @vehicle)
  end
  100.times do
    FactoryGirl.create(:repair, :vehicle => @vehicle)
  end
  visit admin_vehicle_path(@vehicle)
end

Then(/^I can see years since (\d+)$/) do |year|
  find('#vehicle_year_1i').should have_content(year)
end

Then(/^I can see the total costs of the related fuel expenses$/) do
  table_totals = number_to_currency(@vehicle.total_fuel_expenses, :unit => "CHF", :format => '%u %n')
  find('#total_fuel_expenses').should have_content(table_totals)
end

Then(/^I can see the total costs of the related repairs$/) do
  table_totals = number_to_currency(@vehicle.total_repairs, :unit => "CHF", :format => '%u %n')
  find('#total_repairs').should have_content(table_totals)
end
