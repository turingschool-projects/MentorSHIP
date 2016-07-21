FactoryGirl.define do
  factory :user do
    sequence :name do |n|
      "username #{n}"
    end
    sequence :email do |n|
      "email#{n}@example.com"
    end
    phone_number "555-555-5555"
    slack_username "@user"
  end
end
