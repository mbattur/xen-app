FactoryBot.define do
  factory :credit_card_debt do
    association :user
    card_name { 'capital one' }
    balance { '9' }
  end
end
