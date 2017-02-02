FactoryGirl.define do
  factory :student do
    avatar "https://images.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.forumla.de%2Fattachments%2Fkreative-ecke%2F151339d1395599937-avatar-wettbewerb-abstimmung-tumblr_mwe88mlxe41sare1go1_1280.png&f=1"
    name "Turing Student"
    email
    phone_number
    slack_username
    bio "This is all about me"
    last_active DateTime.now
  end

  sequence :slack_username do |n|
    "@person#{n}"
  end

  sequence :phone_number do |n|
    "720-5#{n}5-1#{n}3#{n}"
  end

  sequence :email do |n|
    "student#{n}@turing.io"
  end

end
