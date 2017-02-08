require "rails_helper"

describe "As a visitor" do
  context "When I go to the about page" do
    scenario "I see infomation about Mentorship", :js => true do

      visit '/about'

      expect(page).to have_content("They say you don't truelly know something until you teach it.
      Signing up offers unique oppurtunity to being a mentor to a budding
      software developer reap the the rewards of polishing your skills, staying current
      and teaching the paying it forwards.")
    end
  end
end
