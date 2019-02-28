FactoryBot.define do
  factory :stack_account do
    association :user
    balance { '1222' }
  end
end
