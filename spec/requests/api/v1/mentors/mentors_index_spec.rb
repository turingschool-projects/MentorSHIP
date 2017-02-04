require "rails_helper"

RSpec.describe "GET /api/v1/mentors" do
  it "returns an array of all mentors" do
    timezone = create(:mentor_timezone)
    raw_mentors = create_list(:mentor, 3, profile_completed: true, mentor_timezone: timezone)
    raw_mentor = raw_mentors.first

    get "/api/v1/mentors"

    mentors = JSON.parse(response.body)

    expect(mentors.count).to eq(3)
    expect(response.status).to eq(200)

    mentor = mentors.first

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

  it "only returns mentors with completed profiles" do
    timezone = create(:mentor_timezone)
    mentor1 = create(:mentor, profile_completed: true, mentor_timezone: timezone)
    mentor2 = create(:mentor, profile_completed: false, mentor_timezone: timezone)

    get "/api/v1/mentors"

    mentor = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(mentor.count).to eq(1)

    expect(mentor.first['name']).to eq(mentor1.name)
  end
end
