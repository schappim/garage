Given(/^I'm logged in$/) do
  login
end

Given(/^have a set of fuel expenses$/) do
  100.times do
    FactoryGirl.create(:fuel_expense)
  end
end

When(/^I view the fuel expenses page$/) do
  visit '/admin/fuel_expenses'
end

Then(/^I can see the total costs$/) do
  costs_in_the_table = number_to_currency(FuelExpense.sum(:cost), :unit => "CHF", :format => '%u %n')
  costs_on_form = find('.fuel_expenses_totals').text
  costs_on_form.should == costs_in_the_table
end

Then(/^I can see the quantity of total expenses$/) do
  costs_in_the_table = FuelExpense.all.count
  costs_on_form = find('.fuel_expenses_qty').text.to_i
  costs_on_form.should == costs_in_the_table
end

World(ActionView::Helpers::NumberHelper)
