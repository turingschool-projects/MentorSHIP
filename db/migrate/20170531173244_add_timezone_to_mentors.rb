class AddTimezoneToMentors < ActiveRecord::Migration[5.0]
  def change
    add_column :mentors, :timezone, :string
  end
end
