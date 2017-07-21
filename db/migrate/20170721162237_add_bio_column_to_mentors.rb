class AddBioColumnToMentors < ActiveRecord::Migration[5.0]
  def change
    add_column :mentors, :bio, :string
  end
end
