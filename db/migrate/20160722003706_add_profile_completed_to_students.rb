class AddProfileCompletedToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :profile_completed, :boolean, default: false
  end
end
