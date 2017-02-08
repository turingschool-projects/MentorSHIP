class UpdateUserTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :location
    remove_column :users, :expertise
    remove_column :users, :company
    remove_column :users, :position
  end
end
