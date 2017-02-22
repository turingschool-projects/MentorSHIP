class AddProfileCompleteToMentors < ActiveRecord::Migration[5.0]
  def change
    add_column :mentors, :profile_complete, :boolean, default: false 
  end
end
