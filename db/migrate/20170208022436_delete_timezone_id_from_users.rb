class DeleteTimezoneIdFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :timezone_id
  end
end
