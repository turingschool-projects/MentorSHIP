class ChangesColumnNamesOnMentorSkills < ActiveRecord::Migration[5.0]
  def change
    remove_column :mentor_skills, :skills_id
    remove_column :mentor_skills, :mentors_id
  end

  def change
    add_reference :mentor_skills, :skill, index: true
    add_reference :mentor_skills, :mentor, index: true
  end
end
