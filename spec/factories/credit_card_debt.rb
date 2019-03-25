FactoryBot.define do
  factory :credit_card_debt do
    association :user
    card_name { Faker::Bank.name }
    balance { Faker::Number.number(3) }
  end
end
