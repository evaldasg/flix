FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "evo#{n}" }
    sequence(:username) { |n| "evi#{n}" }
    password "password"
    password_confirmation "password"
    email { "#{name}@example.com" }
  end
end
