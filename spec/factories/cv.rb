FactoryGirl.define do
  factory :Resume do
    sequence(:email) { |n| "user#{n}@example.com" }
    first_name "Omniscient"
    last_name "Bob"
    phone_1 "404-404-4040"
    address "123 ABC Lane"
    postal_code "30000"
    city "Atlanta"
    state "GA"
  end
end
