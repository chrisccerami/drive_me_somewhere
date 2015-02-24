FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "example#{n}@user.com" }
    name "Kathleen Hanna"
    password "password"
    phone "973-555-4840"
  end
end
