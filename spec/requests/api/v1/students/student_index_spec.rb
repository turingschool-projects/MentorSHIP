require "rails_helper"

RSpec.describe "GET /api/v1/students" do
  it "returns an array of all students" do
    students = create_list(:student, 3)
    student = students.first

    get "/api/v1/students"
    parsed_json = JSON.parse(response.body)
    recieved_students = parsed_json["students"]

    expect(response.status).to eq(200)
    expect(recieved_students.count).to eq(3)

    expect(recieved_students.first["name"]).to eq(student.user.name)
    expect(recieved_students.first["email"]).to eq(student.user.email)
    expect(recieved_students.first["phone_number"]).to eq(student.user.phone_number)
    expect(recieved_students.first["slack_username"]).to eq(student.user.slack_username)
    expect(recieved_students.first["cohort"]).to eq(student.cohort.number)
  end
end
