require 'spec_helper'

describe AdminUser do

  it "has a valid factory" do
    FactoryGirl.create(:admin_user).should be_valid
  end

end
