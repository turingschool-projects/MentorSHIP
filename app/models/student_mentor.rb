class StudentMentor < ApplicationRecord
  belongs_to :mentor
  belongs_to :student

  validates_uniqueness_of :mentor_id, :scope => :student_id
end
