FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "example#{n}@user.com" }
    name "Kathleen Hanna"
    password "password"
    phone "973-555-4840"
  end

  factory :lift_request do
    origin
    destination
  end

  factory :origin do
    longitude 42.349932
    latitude -71.163295
    address "18 Fairbanks St"
    city "Boston"
    state "MA"
    zip_code "02135"
  end

  factory :destination do
    longitude 40.834362
    latitude -74.162015
    address "66 Kenzel Ave"
    city "Nutley"
    state "NJ"
    zip_code "07110"
  end
end
