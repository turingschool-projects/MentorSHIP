require 'faraday'
require 'json'
require './app/models/timezone.rb'

class Seed

  def start
    skills
    find_mentors
    create_locations
  end

  def get_all_census_users
    this = Faraday.get("#{ENV['CENSUS_URL']}/api/v1/users/?access_token=#{ENV['CENSUS_ACCESS_TOKEN']}")
    this.body.empty? ? [] : JSON.parse(this.body, symbolize_names: true)
  end

  def find_mentors
    get_all_census_users.each do |user|
      create_user(user) if user[:roles].any?{|role| role[:name] == "mentor"}
    end
  end

  def create_locations
    Location.create(
      search_name: 'Denver, CO, USA',
      full_name: 'Denver, CO, USA',
      timezone_name: 'America/Denver'
    )
  end

  def create_user(user)
    genders = ["Male", "Female", "Other"]
    accepting_mentees = [true, false]
    new_user = User.create!(
      phone: '911-867-5309',
      bio: "Say something cool about yourself",
      last_active: Time.now,
      token: "First OAuth login will overwrite this",
      census_id: user[:id]
    )
    puts "Created user: #{user[:first_name]}!"
    new_mentor = new_user.create_mentor!(
      expertise: "Enter your expertise here",
      location: 'Denver, CO, USA',
      company: "Company",
      position: "Position",
      gender: genders.sample,
      active: accepting_mentees.sample
    )
    puts "Created mentor: #{new_user.mentor.id}"
    10.times do
      new_mentor.skills << Skill.all.sample
    end
  end

  def skills
    Skill.create(name: 'Angular.js', skill_type: 2)
    Skill.create(name: 'Clojure', skill_type: 2)
    Skill.create(name: 'CS Fundamentals', skill_type: 2)
    Skill.create(name: 'CSS/Sass', skill_type: 2)
    Skill.create(name: 'Django', skill_type: 2)
    Skill.create(name: 'Elixir', skill_type: 2)
    Skill.create(name: 'Ember.js', skill_type: 2)
    Skill.create(name: 'Express.js', skill_type: 2)
    Skill.create(name: 'Flask', skill_type: 2)
    Skill.create(name: 'Functional Programming', skill_type: 2)
    Skill.create(name: 'Go', skill_type: 2)
    Skill.create(name: 'Google Script', skill_type: 2)
    Skill.create(name: 'Ionic', skill_type: 2)
    Skill.create(name: 'Java', skill_type: 2)
    Skill.create(name: 'JavaScript', skill_type: 2)
    Skill.create(name: 'jQuery', skill_type: 2)
    Skill.create(name: 'Node.js', skill_type: 2)
    Skill.create(name: 'Phoenix', skill_type: 2)
    Skill.create(name: 'Python', skill_type: 2)
    Skill.create(name: 'React.js', skill_type: 2)
    Skill.create(name: 'Ruby', skill_type: 2)
    Skill.create(name: 'Ruby', skill_type: 2)
    Skill.create(name: 'Scala', skill_type: 2)
    Skill.create(name: 'Sinatra', skill_type: 2)

    Skill.create(name: 'Agile Software Development', skill_type: 0)
    Skill.create(name: 'Architecture', skill_type: 0)
    Skill.create(name: 'Civic Tech', skill_type: 0)
    Skill.create(name: 'DevOps', skill_type: 0)
    Skill.create(name: 'Machine Learning', skill_type: 0)
    Skill.create(name: 'Open Source Contribution', skill_type: 0)
    Skill.create(name: 'Personal Development/GTD', skill_type: 0)
    Skill.create(name: 'System Design', skill_type: 0)
    Skill.create(name: 'Systems Development Life Cycle (SDLC)', skill_type: 0)
    Skill.create(name: 'Technical Interview Prep', skill_type: 0)
    Skill.create(name: 'Test Driven Development (TDD)', skill_type: 0)
    Skill.create(name: 'Testing', skill_type: 0)
    Skill.create(name: 'UI Development (Mockup --> Markup)', skill_type: 0)

    Skill.create(name: 'CFPs', skill_type: 1)
    Skill.create(name: 'Culture/Behavioral Interview Prep', skill_type: 1)
    Skill.create(name: 'General Problem Solving', skill_type: 1)
    Skill.create(name: 'Marketing', skill_type: 1)
    Skill.create(name: 'Parenting', skill_type: 1)
    Skill.create(name: 'Product Development & Management', skill_type: 1)
    Skill.create(name: 'Project Management', skill_type: 1)
    Skill.create(name: 'Public Speaking', skill_type: 1)
    Skill.create(name: 'Resume & Cover Letters', skill_type: 1)
    Skill.create(name: 'Social Issues in the Tech Industry', skill_type: 1)
    Skill.create(name: 'Wellness & Stress Management', skill_type: 1)
  end
end

Seed.new.start
