require 'spec_helper'

describe RepairPart do

  it "has a valid factory" do
    FactoryGirl.create(:repair_part).should be_valid
  end

  it "is invalid if units is less than or equal to 0" do
    FactoryGirl.build(:repair_part, :units => 0).should_not be_valid
    FactoryGirl.build(:repair_part, :units => -1).should_not be_valid
  end

  it "is invalid without units" do
    FactoryGirl.build(:repair_part, :units => nil).should_not be_valid
  end

  it "is invalid if it doesn't belong to an item" do
    FactoryGirl.build(:repair_part, :item_id => nil).should_not be_valid
  end

  it "is invalid if the units exceeds the item units" do
    FactoryGirl.build(:repair_part, :units => 2000).should_not be_valid
  end
end
