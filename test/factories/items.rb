# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    brand 'Bosh'
    name 'Battery'

    association :category 
  end
end
