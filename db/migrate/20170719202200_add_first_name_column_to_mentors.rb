class AddFirstNameColumnToMentors < ActiveRecord::Migration[5.0]
  def change
    add_column :mentors, :first_name, :string
    add_column :mentors, :last_name, :string
  end
end
