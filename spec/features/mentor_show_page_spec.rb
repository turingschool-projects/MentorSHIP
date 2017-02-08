require 'rails_helper'

describe 'As a visitor' do
  context 'I go to a mentors show page' do
    it 'shows me a mentors information' do
      timezone = create(:timezone)
      mentor_1, mentor_2 = create_list(:mentor, 2)
      visit '/mentors/1'
      expect(page).to have_content("Bob")
      expect(page).to_not have_content("Frank")
    end
  end
end
