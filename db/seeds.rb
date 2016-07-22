# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
cohort_1602 = Cohort.create(number: 1602)

20.times do |n|
  student = Student.new(profile_completed: true)
  student.cohort = cohort_1602
  user = User.new(
    name: "student #{n}",
    email: "student#{n}@turing.io",
    phone_number: "555-555-5555",
    slack_username: "student#{n}",
    github_avatar_url: "https://avatars2.githubusercontent.com/u/14855129?v=3&s=460"
  )
  student.user = user
  result = student.save
  puts "Saving user #{n + 1} - result: #{result}"
  puts student.errors.full_messages.join(', ') unless result
end
