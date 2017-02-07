class DropStudentMentorsTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :students_mentors
  end
end
