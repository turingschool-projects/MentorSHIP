class StudentsMentor < ApplicationRecord
  belongs_to :students
  belongs_to :mentors
end
