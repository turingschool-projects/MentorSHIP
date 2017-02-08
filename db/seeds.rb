class Seed

  def start
    create_timezones
    create_users
  end

  def create_timezones
    ['Pacific', 'Mountain', 'Central', 'Eastern'].each do |location|
      Timezone.create!(name: location)
      puts "Created time zone: #{location}!"
    end
  end

  def create_users
    100.times do |n|
      student = User.create!(
      )
      puts "Crated student: #{n}!"
    end
  end

  def create_mentors
    50.times do |n|
      mentor = Mentor.create!(
        avatar: Faker::Avatar.image,
        name: Faker::Name.name,
        email: "mentor#{n}@notTuring.io",
        phone_number: Faker::PhoneNumber.phone_number,
        slack_username: "@mentor#{n}",
        location: Faker::Address.city,
        mentor_timezone_id: MentorTimezone.find(Random.new.rand(1..4)).id,
        bio: 'This is my mentor bio.',
        expertise: Faker::Lorem.words(6).join(", "),
        company: Faker::Company.name,
        position: "Senior Rails dev.",
        last_active: DateTime.now,
        profile_completed: true
      )
      puts "Created mentor: #{mentor.name}!"
    end
  end

end


Seed.new.start
