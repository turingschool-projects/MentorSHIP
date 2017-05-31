# require 'rails_helper'
#
# describe 'user searches mentors by gender', :type => :feature, :js => true do
#   it 'shows mentors of that gender' do
#     user = create(:mentor, gender:"male")
#     user_two = create(:mentor, gender:"female")
#     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
#
#     visit mentors_path
#     sleep(5)
#     select "Male", :from => "gender-select"
#
#     expect(page).to have_content(user)
#     expect(page).to_not have_content(user)
#   end
# end
