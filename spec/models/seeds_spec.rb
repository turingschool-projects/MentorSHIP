require "rails_helper"

describe "hit the census API" do
  it "returns all users" do

    seed = Seeds.new
    result = seed.get_all_census_users


  end
end
