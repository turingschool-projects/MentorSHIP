class Student < ApplicationRecord
  validates :avatar,
            :name,
            :email,
            :phone_number,
            :slack_username,
            :bio,
            presence: true

  validates :email,
            :phone_number,
            :slack_username,
            uniqueness: true

  has_many :students_mentor
  has_many :mentors, through: :students_mentor
end
