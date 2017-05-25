class CreateMentorSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :mentor_skills do |t|
      t.references :skills, foreign_key: true
      t.references :mentors, foreign_key: true
    end
  end
end
