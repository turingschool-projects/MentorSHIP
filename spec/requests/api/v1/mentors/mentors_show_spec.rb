require "rails_helper"

RSpec.describe "GET /api/v1/mentors/:id" do
  it "returns a single by id" do
    timezone = create(:mentor_timezone)
    raw_mentor = create(:mentor, profile_completed: true, mentor_timezone: timezone)

    get "/api/v1/mentors/#{raw_mentor.id}"

    mentor = JSON.parse(response.body)

    expect(response.status).to eq(200)

    readable_time = raw_mentor.last_active.strftime("%A %d %b %Y %l:%M %p")

    expect(mentor['id']).to eq(raw_mentor.id)
    expect(mentor['avatar']).to eq(raw_mentor.avatar)
    expect(mentor['name']).to eq(raw_mentor.name)
    expect(mentor['email']).to eq(raw_mentor.email)
    expect(mentor['phone_number']).to eq(raw_mentor.phone_number)
    expect(mentor['slack_username']).to eq(raw_mentor.slack_username)
    expect(mentor['location']).to eq(raw_mentor.location)
    expect(mentor['mentor_timezone_id']).to eq(raw_mentor.mentor_timezone_id)
    expect(mentor['bio']).to eq(raw_mentor.bio)
    expect(mentor['expertise']).to eq(raw_mentor.expertise)
    expect(mentor['company']).to eq(raw_mentor.company)
    expect(mentor['position']).to eq(raw_mentor.position)
    expect(mentor['last_active']).to eq(readable_time)
  end
end
