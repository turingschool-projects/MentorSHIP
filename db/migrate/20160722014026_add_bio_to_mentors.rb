class AddBioToMentors < ActiveRecord::Migration[5.0]
  def change
    add_column :mentors, :bio, :text
  end
end
