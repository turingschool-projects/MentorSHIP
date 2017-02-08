FactoryGirl.define do
  factory :mentor do
    timezone nil
    expertise "Rails"
    location Faker::LordOfTheRings.location
    company Faker::Company.name
    position Faker::Company.profession
    user nil
  end
end
