FactoryGirl.define do

  factory :mentor_timezone do
    name { ["Pacific", "Mountain", "Central", "Eastern"].sample }
  end

end
