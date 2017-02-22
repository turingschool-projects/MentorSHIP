class AddActiveToMentors < ActiveRecord::Migration[5.0]
  def change
    add_column :mentors, :active, :boolean, default: false
  end
end
