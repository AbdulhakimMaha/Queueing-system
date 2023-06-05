FactoryBot.define do
  factory :covid do
    test_date { Faker::Date.backward(days: 365) }
  end
end
