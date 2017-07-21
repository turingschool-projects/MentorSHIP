require 'rails_helper'

feature "user can see root" do
  scenario "user visits root" do
    visit '/'

    expect(current_path).to eq(root_path)
    expect(page).to have_content("I am a current mentor.")
    expect(page).to have_content("I am a current student looking for a mentor.")
    expect(page).to have_content("I would like to become a mentor.")

    click_on "I would like to become a mentor"

    expect(current_path).to eq(new_mentor_path)

    fill_in :mentor_first_name, with: "Ilana"
    fill_in :mentor_last_name, with: "Corson"
    fill_in :mentor_expertise, with: "rails"
    fill_in :mentor_location, with: "Denver"
    fill_in :mentor_position, with: "Senior Dev"

    click_on "Sign Up"
    
    expect(current_path).to eq(dashboard_path(Mentor.last))
  end
end
