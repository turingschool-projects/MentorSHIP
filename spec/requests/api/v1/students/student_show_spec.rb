require "rails_helper"

RSpec.describe "GET /api/v1/students/:id" do
  it "returns a single student by id" do
    raw_student = create(:student)

    get "/api/v1/students/#{raw_student.id}"

    recieved_student = JSON.parse(response.body)

    expect(response.status).to eq(200)

    readable_time = raw_student.last_active.strftime("%A %d %b %Y %l:%M %p")

    expect(recieved_student["id"]).to eq(raw_student.id)
    expect(recieved_student["avatar"]).to eq(raw_student.avatar)
    expect(recieved_student["name"]).to eq(raw_student.name)
    expect(recieved_student["email"]).to eq(raw_student.email)
    expect(recieved_student["phone_number"]).to eq(raw_student.phone_number)
    expect(recieved_student["slack_username"]).to eq(raw_student.slack_username)
    expect(recieved_student["bio"]).to eq(raw_student.bio)
    expect(recieved_student["last_active"]).to eq(readable_time)
  end
end
