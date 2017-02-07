class UpdateStudentsMentorTable < ActiveRecord::Migration[5.0]
  def change
    rename_column :students_mentors, :students_id, :student_id
    rename_column :students_mentors, :mentors_id, :mentor_id
  end
end
