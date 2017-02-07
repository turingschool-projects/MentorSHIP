class Mentor < ApplicationRecord
  validates :name,
            :avatar,
            :email,
            :phone_number,
            :slack_username,
            :location,
            :mentor_timezone_id,
            :bio,
            :expertise,
            :company,
            :position,
            presence: true

  validates :email,
            :phone_number,
            :slack_username,
            uniqueness: true

  has_many :students_mentor
  has_many :students, through: :students_mentor

  belongs_to :mentor_timezone

end
