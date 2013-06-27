Given(/^a vehicle exists$/) do
  @vehicle = FactoryGirl.create(:vehicle)
end

When(/^I add a fuel expense registry$/) do
  @fuel_expense = FactoryGirl.create(:fuel_expense, :vehicle => @vehicle)
end

Then(/^the vehicle's kms get updated$/) do
  @vehicle.kms.should == @fuel_expense.km
end
