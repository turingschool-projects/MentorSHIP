require 'rails_helper'

describe 'As a visitor' do
  context 'I go to a mentors show page' do
    it 'shows me a mentors information' do
      timezone = create(:timezone)
      user_1, user_2 = create_list(:user, 2)
      mentor_1, = create(:mentor, user: user_1, timezone: timezone)
      mentor_2, = create(:mentor, location: "Denver", user: user_2, timezone: timezone)
      visit '/mentors/1'
      expect(page).to have_content("#{mentor_1.location}")
      expect(page).to_not have_content("#{mentor_2.location}")
    end
  end
end
