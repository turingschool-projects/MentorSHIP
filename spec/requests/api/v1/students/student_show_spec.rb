require "rails_helper"

RSpec.describe "GET /api/v1/students/:id" do
  it "returns a single student by id" do
    student = create(:student)

    get "/api/v1/students/#{student.id}"
    parsed_json = JSON.parse(response.body)
    recieved_student = parsed_json["student"]

    expect(response.status).to eq(200)

    expect(recieved_student["id"]).to eq(student.id)
    expect(recieved_students["github_avatar"]).to eq(student.user.github_avatar_url)
    expect(recieved_student["name"]).to eq(student.user.name)
    expect(recieved_student["email"]).to eq(student.user.email)
    expect(recieved_student["phone_number"]).to eq(student.user.phone_number)
    expect(recieved_student["slack_username"]).to eq(student.user.slack_username)
    expect(recieved_student["cohort"]).to eq(student.cohort.number)
  end
end
