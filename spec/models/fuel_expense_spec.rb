require 'spec_helper'

describe FuelExpense do

  it "has a valid factory" do
    FactoryGirl.create(:fuel_expense).should be_valid
  end

  it "is invalid without a cost" do
    FactoryGirl.build(:fuel_expense, :cost => nil).should_not be_valid
  end

  it "is invalid without a date" do
    FactoryGirl.build(:fuel_expense, :fueled_on => nil).should_not be_valid
  end

  it "is invalid without an invoice" do
    FactoryGirl.build(:fuel_expense, :invoice => nil).should_not be_valid
  end

  it "is invalid without kms" do
    FactoryGirl.build(:fuel_expense, :km => nil).should_not be_valid
  end

  it "is invalid without liters" do
    FactoryGirl.build(:fuel_expense, :liters => nil).should_not be_valid
  end

  it "is invalid if km are less than or equal to cero" do
    FactoryGirl.build(:fuel_expense, :km => -100000).should_not be_valid
    FactoryGirl.build(:fuel_expense, :km => 0).should_not be_valid
  end

  it "is invalid if cost is less than or equal to cero" do
    FactoryGirl.build(:fuel_expense, :cost => -100).should_not be_valid
    FactoryGirl.build(:fuel_expense, :cost => 0).should_not be_valid
  end

  it "is invalid if liters is less than cero" do
    FactoryGirl.build(:fuel_expense, :liters => -10).should_not be_valid
  end

  it "is invalid if it doesn't belong to a vehicle" do
    FactoryGirl.build(:fuel_expense, :vehicle_id => nil).should_not be_valid
  end


end
