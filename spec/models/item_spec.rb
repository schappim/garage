require 'spec_helper'

describe Item do
  it "has a valid factory" do
    FactoryGirl.create(:item).should be_valid
  end

  it "is invalid without a name" do
    FactoryGirl.build(:item, :name => nil).should_not be_valid
  end

  it "is invalid without a brand" do
    FactoryGirl.build(:item, :brand => nil).should_not be_valid
  end

  it "is invalid if it doesn't belong to a category" do
    FactoryGirl.build(:item, :category_id => nil).should_not be_valid
  end

  it "is invalid without units" do
    FactoryGirl.build(:item, :units => nil).should_not be_valid
  end

  it "can only have 0 or more units" do
    FactoryGirl.build(:item, :units => -1).should_not be_valid
  end

end
