# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fuel_expense do
    cost 10.0 
    fueled_on Time.now
    invoice 'N123'
    km 12345
    liters 22.3
    association :vehicle 
  end
end
