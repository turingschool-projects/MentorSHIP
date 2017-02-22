class CreateStudentsMentors < ActiveRecord::Migration[5.0]
  def change
    create_table :students_mentors do |t|
      t.references :students, foreign_key: true
      t.references :mentors, foreign_key: true

      t.timestamps
    end
  end
end
