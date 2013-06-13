require 'spec_helper'

describe Repair do

  it "has a valid factory" do
    FactoryGirl.create(:repair).should be_valid
  end

  it "is invalid without a cost" do
    FactoryGirl.build(:repair, :cost => nil).should_not be_valid
  end

  it "is invalid without a date" do
    FactoryGirl.build(:repair, :repaired_on => nil).should_not be_valid
  end

  it "is invalid without an invoice" do
    FactoryGirl.build(:repair, :invoice => nil).should_not be_valid
  end

  it "is invalid without kms" do
    FactoryGirl.build(:repair, :kms => nil).should_not be_valid
  end

  it "is invalid without hours" do
    FactoryGirl.build(:repair, :hours => nil).should_not be_valid
  end

  it "is invalid if it doesn't belong to a vehicle" do
    FactoryGirl.build(:repair, :vehicle_id => nil).should_not be_valid
  end


end
