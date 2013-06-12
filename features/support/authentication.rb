module AuthenticationSteps
  def login
    admin = FactoryGirl.create(:admin_user)
    visit '/admin/login'
    fill_in 'admin_user_email', :with => admin.email
    fill_in 'admin_user_password', :with => admin.password
    click_on 'Login'
  end
end

World(AuthenticationSteps)
