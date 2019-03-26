FactoryBot.define do
  factory :credit_card_debt do
    association :user
    card_name { Faker::Bank.name }
    balance { Faker::Number.number(2) }
    # balance { 100 }
  end
end
