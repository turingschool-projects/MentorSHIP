class AddCensusIdToUserTable < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :census_id, :integer
  end
end
