20.times do |n|
  student = Student.create!(

  )
end

20.times do |n|
  mentor = Mentor.new(
    profile_completed: true,
    location: "Denver",
    bio: "Former Student, current mentor!"
  )
  mentor.mentor_timezone = timezone
  user = User.new(
    name: "mentor #{n}",
    email: "mentor#{n}@turing.io",
    phone_number: "555-555-5555",
    slack_username: "mentor#{n}",
    github_avatar_url: "https://avatars2.githubusercontent.com/u/14855129?v=3&s=460"
  )
  mentor.user = user
  result = mentor.save
  puts "Saving mentor #{n + 1} - result: #{result}"
  puts mentor.errors.full_messages.join(', ') unless result
end
