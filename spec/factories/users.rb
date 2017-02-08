FactoryGirl.define do
  factory :user do
    phone Faker::PhoneNumber.phone_number
    bio Faker::Hacker.say_something_smart
    last_active Time.now
    token 1
  end
end
