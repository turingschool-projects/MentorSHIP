FactoryGirl.define do

  factory :timezone do
    name { ["Pacific", "Mountain", "Central", "Eastern"].sample }
  end

end
