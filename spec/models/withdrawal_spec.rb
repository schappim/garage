require 'spec_helper'

describe Withdrawal do

  it "has a valid factory" do
    FactoryGirl.create(:withdrawal).should be_valid
  end

  it "is invalid if units is less than or equal to 0" do
    FactoryGirl.build(:withdrawal, :units => 0).should_not be_valid
    FactoryGirl.build(:withdrawal, :units => -1).should_not be_valid
  end

  it "is invalid without units" do
    FactoryGirl.build(:withdrawal, :units => nil).should_not be_valid
  end

  it "is invalid if units less than or equal to cero" do
    FactoryGirl.build(:withdrawal, :units => -1).should_not be_valid
    FactoryGirl.build(:withdrawal, :units => 0).should_not be_valid
  end

  it "is invalid without a reason" do
    FactoryGirl.build(:withdrawal, :reason => nil).should_not be_valid
    FactoryGirl.build(:withdrawal, :reason => "").should_not be_valid
  end

  it "is invalid if it doesn't belong to an item" do
    FactoryGirl.build(:withdrawal, :item_id => nil).should_not be_valid
  end

  it "is invalid if the units exceeds the item units" do
    FactoryGirl.build(:withdrawal, :units => 2000).should_not be_valid
  end
end
