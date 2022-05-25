FactoryBot.define do
    factory :expense do
        name { Faker::Lorem.word }
        amount { Faker::Number.decimal(0) }
        date { Faker::Date.between(from: Date.today - 1, to: Date.today) }
        user
    end
end