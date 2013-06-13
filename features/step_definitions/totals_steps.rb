Given(/^I'm logged in$/) do
  login
end

Given(/^have a set of fuel expenses$/) do
  100.times do
    FactoryGirl.create(:fuel_expense)
  end
end

Given(/^have a set of repairs$/) do
  100.times do
    FactoryGirl.create(:repair)
  end
end

When(/^I view the fuel expenses page$/) do
  visit '/admin/fuel_expenses'
end

When(/^I visit the "(.*?)" page$/) do |page_name|
  visit "/admin/#{page_name}"
end

Then(/^I can see the "(.*?)" total costs$/) do |model|
  @model = case model
             when 'fuel expenses' then FuelExpense
             when 'repairs' then Repair
           end
  costs_in_the_table = number_to_currency(@model.sum(:cost), :unit => "CHF", :format => '%u %n')
  costs_on_form = find('.total_costs').text
  costs_on_form.should == costs_in_the_table
end

Then(/^I can see the "(.*?)" total of registries$/) do |model|
  @model = case model
             when 'fuel expenses' then FuelExpense
             when 'repairs' then Repair
           end
  costs_in_the_table = @model.all.count
  costs_on_form = find('.total_registries').text.to_i
  costs_on_form.should == costs_in_the_table
end

World(ActionView::Helpers::NumberHelper)
