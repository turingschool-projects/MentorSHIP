class Student < ApplicationRecord
  belongs_to :user
  belongs_to :cohort

  validates :cohort_id, presence: true
end
