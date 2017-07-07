class Student < ApplicationRecord
  belongs_to :user
  has_many :student_mentors
  has_many :mentors, through: :student_mentors

  delegate :avatar,
           :first_name,
           :last_name,
           :phone,
           :email,
           :slack,
           :bio,
           :last_active,
           :census_id,
           :token,
           :cohort, to: :user
end
