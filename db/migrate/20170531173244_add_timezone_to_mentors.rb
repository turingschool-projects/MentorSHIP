class AddTimezoneToMentors < ActiveRecord::Migration[5.0]
  def change
    add_column :mentors, :timezone_name, :string
  end
end
