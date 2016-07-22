class Mentor < ApplicationRecord
  belongs_to :user
  belongs_to :timezone

  validates :timezone, presence: true
end
