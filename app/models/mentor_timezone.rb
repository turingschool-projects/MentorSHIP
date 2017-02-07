class MentorTimezone < ApplicationRecord
  validates :name, presence: true

  has_many :mentors
end
