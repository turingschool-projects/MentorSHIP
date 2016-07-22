require "rails_helper"

RSpec.describe "GET /api/v1/students" do
  it "returns an array of all students" do
    students = create_list(:student, 3)

    get "/api/v1/students", format: :json
    parsed_json = JSON.parse(response.body)
    recieved_students = parsed_json["ideas"]

    expect(response.status).to eq(200)
    expect(recieved_students.count).to eq(3)

    expect(recieved_students.first["name"]).to eq(students.first.user.name)
    expect(recieved_students.first["email"]).to eq(students.first.user.email)
    expect(recieved_students.first["cohort"]).to eq(students.first.cohort)
  end
end
