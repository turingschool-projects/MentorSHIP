class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :search_name
      t.string :full_name
      t.string :timezone_name
    end
  end
end
