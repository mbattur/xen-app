FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
  end

  factory :stack_account do
    association :user
    balance { '333' }
  end
end
