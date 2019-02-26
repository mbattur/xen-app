FactoryBot.define do
  factory :credit_card_debt do
    association :user
    balance { '333' }
  end
end
