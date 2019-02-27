FactoryBot.define do
  factory :credit_card_debt do
    association :user
    card_name { 'capital one' }
    balance { '333' }
  end
end
