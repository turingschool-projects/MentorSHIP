require "rails_helper"

RSpec.describe "GET /api/v1/mentors/:id" do
  it "returns a single by id" do
    mentor = create(:mentor)

    get "/api/v1/mentors/#{mentor.id}"
    parsed_json = JSON.parse(response.body)
    recieved_mentor = parsed_json["mentor"]

    expect(response.status).to eq(200)

    expect(recieved_mentor["id"]).to eq(mentor.id)
    expect(recieved_mentor["github_avatar"]).to eq(mentor.user.github_avatar_url)
    expect(recieved_mentor["name"]).to eq(mentor.user.name)
    expect(recieved_mentor["email"]).to eq(mentor.user.email)
    expect(recieved_mentor["phone_number"]).to eq(mentor.user.phone_number)
    expect(recieved_mentor["slack_username"]).to eq(mentor.user.slack_username)
    expect(recieved_mentor["timezone"]).to eq(mentor.timezone.zone)
    expect(recieved_mentor["location"]).to eq(mentor.location)
    expect(recieved_mentor["bio"]).to eq(mentor.bio)
  end
end
