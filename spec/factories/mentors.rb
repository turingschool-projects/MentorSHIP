FactoryGirl.define do

  factory :mentor do
    avatar "https://images.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.brunningonline.net%2Fsimon%2Fblog%2Farchives%2FSouth%2520Park%2520Avatar.jpg&f=1"
    name "Turing Mentor"
    email
    phone_number
    slack_username
    location "Denver"
    bio "This is about me"
    expertise "Coding"
    company "Turing"
    position "Dev"
    last_active DateTime.now
  end

end
