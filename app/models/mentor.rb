class Mentor < ApplicationRecord
  belongs_to :user
  belongs_to :mentor_timezone

  validates :mentor_timezone, presence: true
end
