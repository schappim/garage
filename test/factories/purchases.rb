# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :purchase do
    cost_per_unit '12.34'
    units 10
    total_cost '123.4'

    association :item 
  end
end
