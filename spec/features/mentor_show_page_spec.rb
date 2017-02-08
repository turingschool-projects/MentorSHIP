require 'rails_helper'

describe 'As a visitor' do
  context 'I go to a mentors show page' do
    it 'shows me a mentors information' do
      MentorTimezone.create(name: "Mountain")
      Mentor.create(avatar: "string", name: "Bob", email: "This@gmail.com", phone_number: "222222222", slack_username: "slackguy82", location: "Denver", bio: "Soft ware dev with now thinz bouts codessss", expertise: "all", company: "fan", position: "dev pro", mentor_timezone_id: MentorTimezone.first.id, last_active:DateTime.now , profile_completed: true)
      Mentor.create(avatar: "string", name: "Frank", email: "This@gmail.com", phone_number: "222222222", slack_username: "slackguy82", location: "Denver", bio: "Soft ware dev with now thinz bouts codessss", expertise: "all", company: "fan", position: "dev pro", mentor_timezone_id: MentorTimezone.first.id, last_active:DateTime.now , profile_completed: true)
      visit '/mentors/1'
      expect(page).to have_content("Bob")
      expect(page).to_not have_content("Frank")
    end
  end
end
