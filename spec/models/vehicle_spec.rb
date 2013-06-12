require 'spec_helper'

describe Vehicle do

  it "has a valid factory" do
    FactoryGirl.create(:vehicle).should be_valid
  end

  it "is invalid without a make" do
    FactoryGirl.build(:vehicle, :make => nil).should_not be_valid
  end

  it "is invalid without a model" do
    FactoryGirl.build(:vehicle, :model => nil).should_not be_valid
  end

  it "is invalid without a plate" do
    FactoryGirl.build(:vehicle, :plate => nil).should_not be_valid
  end

  it "is invalid without a year" do
    FactoryGirl.build(:vehicle, :year => nil).should_not be_valid
  end

  it "is invalid if not related to a vehicle type" do
    FactoryGirl.build(:vehicle, :vehicle_type_id => nil).should_not be_valid
  end

end
