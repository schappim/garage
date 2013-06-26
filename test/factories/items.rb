# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    brand 'Bosh'
    sequence(:name){|n| "Battery#{n}" }
    units 5

    association :category 
  end
end
