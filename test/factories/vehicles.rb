# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vehicle do
    make 'Toyota'
    model 'Yaris'
    plate 'VD 123'
    year Time.now
    kms 1234567

    association :vehicle_type 
  end
end
