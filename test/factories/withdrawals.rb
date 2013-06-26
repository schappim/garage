# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :withdrawal do
    units 3
    reason "Cuz I'm the boss"

    association :item 
  end
end
