FactoryBot.define do
  factory :stack_account do
    association :user
    balance { '1050' }
  end
end
