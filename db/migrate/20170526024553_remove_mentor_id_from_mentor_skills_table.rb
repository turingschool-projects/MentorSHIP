class RemoveMentorIdFromMentorSkillsTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :mentor_skills, :skills_id, :integer
    remove_column :mentor_skills, :mentors_id, :integer
  end
end
