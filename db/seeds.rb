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

end


Seed.new.start
