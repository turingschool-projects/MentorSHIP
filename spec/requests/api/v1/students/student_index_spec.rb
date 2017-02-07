require "rails_helper"

RSpec.describe "GET /api/v1/students" do
  it "returns an array of all students" do
    raw_students = create_list(:student, 3, profile_completed: true)
    raw_student = raw_students.first

    get "/api/v1/students"

    students = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(students.count).to eq(3)

    student = students.first

    readable_time = raw_student.last_active.strftime("%A %d %b %Y %l:%M %p")

    expect(student["id"]).to eq(raw_student.id)
    expect(student["avatar"]).to eq(raw_student.avatar)
    expect(student["name"]).to eq(raw_student.name)
    expect(student["email"]).to eq(raw_student.email)
    expect(student["phone_number"]).to eq(raw_student.phone_number)
    expect(student["slack_username"]).to eq(raw_student.slack_username)
    expect(student["bio"]).to eq(raw_student.bio)
    expect(student["last_active"]).to eq(readable_time)
  end

  it "only returns students with completed profiles" do
    student1 = create(:student, profile_completed: true)
    student2 = create(:student, profile_completed: false)

    get "/api/v1/students"

    student = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(student.count).to eq(1)

    expect(student.first['name']).to eq(student1.name)
  end
end
