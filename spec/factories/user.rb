FactoryGirl.define do
  sequence :user_email do |n|
    "user-#{n}@example.com"
  end

  factory :user do
    name 'First name'
    password 'password'
    email { generate :user_email }
    admin true
  end
end
