require 'spec_helper'

describe Purchase do
  it "has a valid factory" do
    FactoryGirl.create(:purchase).should be_valid
  end

  it "is invalid without a cost per unit or a total cost" do
    FactoryGirl.build(:purchase, :cost_per_unit => nil).should be_valid
    FactoryGirl.build(:purchase, :total_cost => nil).should be_valid
    FactoryGirl.build(:purchase, :cost_per_unit => nil, :total_cost => nil).should_not be_valid
  end

  it "should have a valid relationship between cost per unit and total cost" do
    FactoryGirl.build(:purchase, :cost_per_unit => '12.34', :total_cost => '98.99', :units => 10).should_not be_valid
  end

  it "is should save costs as decimals" do
    cost_per_unit = "12.34"
    @purchase = FactoryGirl.create(:purchase, :cost_per_unit => cost_per_unit, :total_cost => nil)
    @purchase.cost_per_unit.to_s.should == cost_per_unit

    total_cost = "98.76"
    @purchase = FactoryGirl.create(:purchase, :cost_per_unit => nil, :total_cost => total_cost)
    @purchase.total_cost.to_s.should == total_cost
  end

  it "is invalid if units is less than or equal to 0" do
    FactoryGirl.build(:purchase, :units => 0).should_not be_valid
    FactoryGirl.build(:purchase, :units => -1).should_not be_valid
  end

  it "is invalid if any of the costs is less than 0" do
    FactoryGirl.build(:purchase, :cost_per_unit => -1).should_not be_valid
    FactoryGirl.build(:purchase, :total_cost => -100).should_not be_valid
  end

  it "is invalid without units" do
    FactoryGirl.build(:purchase, :units => nil).should_not be_valid
  end

  it "is invalid if it doesn't belong to an item" do
    FactoryGirl.build(:purchase, :item_id => nil).should_not be_valid
  end

end
