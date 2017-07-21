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
  end
end
