require "rails_helper"

RSpec.describe "GET /api/v1/mentors" do
  it "returns an array of all mentors" do
    mentors = create_list(:mentor, 3, profile_completed: true)
    mentor = mentors.first

    get "/api/v1/mentors"
    parsed_json = JSON.parse(response.body)
    recieved_mentors = parsed_json["mentors"]

    expect(response.status).to eq(200)
    expect(recieved_mentors.count).to eq(3)

    expect(recieved_mentors.first["id"]).to eq(mentor.id)
    expect(recieved_mentors.first["github_avatar"]).to eq(mentor.user.github_avatar_url)
    expect(recieved_mentors.first["name"]).to eq(mentor.user.name)
    expect(recieved_mentors.first["email"]).to eq(mentor.user.email)
    expect(recieved_mentors.first["phone_number"]).to eq(mentor.user.phone_number)
    expect(recieved_mentors.first["slack_username"]).to eq(mentor.user.slack_username)
    expect(recieved_mentors.first["timezone"]).to eq(mentor.timezone.zone)
    expect(recieved_mentors.first["location"]).to eq(mentor.location)
    expect(recieved_mentors.first["bio"]).to eq(mentor.bio)
  end

  it "only returns mentors with completed profiles" do
    create(:mentor, profile_completed: true)
    create(:mentor, profile_completed: false)

    get "/api/v1/mentors"
    parsed_json = JSON.parse(response.body)
    recieved_mentors = parsed_json["mentors"]

    expect(response.status).to eq(200)
    expect(recieved_mentors.count).to eq(1)
  end
end
