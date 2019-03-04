FactoryBot.define do
  factory :stack_account do
    association :user
    balance { '1300' }
  end
end
