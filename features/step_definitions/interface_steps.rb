When(/^I go to the new vehicle page$/) do
  visit "/admin/vehicles/new"
end

Then(/^I can see years since (\d+)$/) do |year|
  find('#vehicle_year_1i').should have_content(year)
end
