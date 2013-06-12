require 'spec_helper'

describe VehicleType do

  it "has a valid factory" do
    FactoryGirl.create(:vehicle_type).should be_valid
  end

  it "is invalid without a name" do
    FactoryGirl.build(:vehicle_type, :name => nil).should_not be_valid
  end

end
