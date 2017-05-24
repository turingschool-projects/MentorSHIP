class Skill < ApplicationRecord
  validates :name, :skill_type, presence: true
  validates :name, uniqueness: true

  enum skill_type: ["Technical", "Non-Technical", "Languages & Frameworks"]

  has_many :mentor_skills
  has_many :mentors, through: :mentor_skills
end
