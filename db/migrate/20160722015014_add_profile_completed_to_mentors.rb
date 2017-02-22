class AddProfileCompletedToMentors < ActiveRecord::Migration[5.0]
  def change
    add_column :mentors, :profile_completed, :boolean, default: false
  end
end
