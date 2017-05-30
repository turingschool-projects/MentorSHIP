class CreateFavoriteMentors < ActiveRecord::Migration[5.0]
  def change
    create_table :student_mentors do |t|
      t.references :student, foreign_key: true
      t.references :mentor, foreign_key: true
      t.boolean :favorite, default: false

      t.timestamps
    end
  end
end
