# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:name) { |i| "name-#{i}" }

  factory :reading do
    sensor
    value "20"
  end

  factory :sensor do
    name
    type "Temperature"
  end
end
