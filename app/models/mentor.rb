class Mentor < ApplicationRecord
  belongs_to :user

  has_many :mentor_skills
  has_many :skills, through: :mentor_skills

  has_many :student_mentors
  has_many :students, through: :student_mentors

  before_save :determine_timezone


  delegate :avatar,
           :first_name,
           :last_name,
           :email,
           :phone,
           :slack,
           :bio,
           :census_id,
           :token,
           :account_url,
           :last_active, to: :user

  def profile
    attr_list = [
      :account_url, :active, :avatar, :bio, :company,
      :email, :expertise, :first_name, :gender, :last_name,
      :location, :position, :profile_complete, :slack
    ]

    attr_list.reduce({}) do |profile, attr|
      profile.merge!({attr => self.send(attr)})
    end
  end

  def determine_timezone
    return if location.nil?
    loc = Location.find_by_search_name_or_parse(location)
    return if loc.nil?
    assign_attributes(location: loc.full_name, timezone_name: loc.timezone_name)
  end
end
