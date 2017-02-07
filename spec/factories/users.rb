FactoryGirl.define do
  factory :user do
    phone Faker::PhoneNumber.phone_number
    location "Denver Co"
    timezone nil
    bio "This is some things about me."
    expertise "Rails"
    company "Turing"
    position "Senior Dev"
    last_active "2017-02-06 17:23:39"
    token 1
  end
end
