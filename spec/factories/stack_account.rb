FactoryBot.define do
  factory :stack_account do
    association :user
    balance { '333' }
  end
end
