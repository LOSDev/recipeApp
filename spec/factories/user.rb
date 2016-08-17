FactoryGirl.define do
  factory :user do
    email
    name {Faker::Internet.user_name}
    password "password"

  end
  sequence :email do |n|
    "person#{n}@example.com"
  end
end
