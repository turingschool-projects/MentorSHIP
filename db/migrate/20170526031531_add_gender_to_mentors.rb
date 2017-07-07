class AddGenderToMentors < ActiveRecord::Migration[5.0]
  def change
    add_column :mentors, :gender, :string
  end
end
