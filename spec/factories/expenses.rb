FactoryBot.define do
  factory :expense do
    name { Faker::Lorem.word }
    amount { Faker::Number.decimal(0) }
    date_of_expense { Faker::Date.between(from: Date.today - 1, to: Date.today) }
    categories { nil }
    user
  end
end
