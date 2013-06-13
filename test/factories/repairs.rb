# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :repair do
    cost 34.5
    description "this one here"
    invoice "X123"
    repaired_on Time.now
    kms 1234
    hours 7

    association :vehicle
  end
end
