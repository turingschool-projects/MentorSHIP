require 'faraday'
require 'json'
require 'pry'
require './app/models/timezone.rb'

class Seed

  def start
    create_timezones
    find_mentors
  end

  def create_timezones
    ['Pacific', 'Mountain', 'Central', 'Eastern'].each do |location|
      Timezone.create!(name: location)
      puts "Created time zone: #{location}!"
    end
  end

  def get_all_census_users
    this = Faraday.get("https://census-app-staging.herokuapp.com/api/v1/users/?access_token=7b2f733b97791542a1e79207f67e3eba9e991c6a7ccf570a169eaf498160cf1d")
    response = JSON.parse(this.body, symbolize_names: true)
  end

  def find_mentors
    get_all_census_users.each do |user|
      create_user(user) if user[:roles].any?{|role| role[:name] == "mentor"}
    end
  end

  def create_user(user)
    timezone = Timezone.find(rand(1..4))
    new_user = User.create!(
    phone: '911-867-5309',
    bio: "Say something cool about yourself",
    last_active: Time.now,
    token: "First OAuth login will overwrite this",
    census_id: user[:id]
    )
    puts "Created user: #{user[:first_name]}!"
    new_user.create_mentor!(
    timezone_id: timezone.id,
    expertise: "Enter your expertise here",
    location: "location",
    company: "Company",
    position: "Position",
    )
    puts "Created mentor: #{new_user.mentor.id}"
  end

end

Seed.new.start
