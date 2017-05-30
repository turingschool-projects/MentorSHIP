class Mentor < ApplicationRecord
  belongs_to :timezone
  belongs_to :user

  has_many :mentor_skills
  has_many :skills, through: :mentor_skills


  has_many :student_mentors
  has_many :students, through: :student_mentors

  delegate :avatar,
           :first_name,
           :last_name,
           :email,
           :phone,
           :slack,
           :bio,
           :census_id,
           :token,
           :gender,
           :last_active, to: :user

end
