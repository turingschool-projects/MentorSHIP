class UpdateUserTokenToString < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :token, :string
  end
end
