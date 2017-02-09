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
    [1,2,3,5,].each do |n|
      timezone = Timezone.find(rand(1..4))
      user = User.create!(
        phone: Faker::PhoneNumber.phone_number,
        bio: Faker::Hacker.say_something_smart,
        last_active: Time.now,
        token: "token#{n}",
        census_id: "#{n}"
      )
      puts "Created user: #{n}!"
      user.create_mentor!(
        timezone_id: timezone.id,
        expertise: "Rails",
        location: Faker::LordOfTheRings.location,
        company: Faker::Company.name,
        position: Faker::Company.profession,
      )
      puts "Created mentor: #{user.mentor.id}"
    end
  end

end


Seed.new.start
