# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :repair_part do
    units 1

    association :item
    association :repair
  end
end
