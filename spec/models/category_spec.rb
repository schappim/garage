require 'spec_helper'

describe Category do
  it "has a valid factory" do
    FactoryGirl.create(:category).should be_valid
  end

  it "is invalid without a name" do
    FactoryGirl.build(:category, :name => nil).should_not be_valid
  end
end
