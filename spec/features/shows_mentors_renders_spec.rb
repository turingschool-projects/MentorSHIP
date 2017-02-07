require 'rails_helper'

describe 'as a user' do
  context 'I visit the mentors index' do
    scenario 'and the headers render correctly', :js => true do

      visit mentors_path

      expect(page).to have_content("EXPLORE MENTORS")
    end
  end
end
