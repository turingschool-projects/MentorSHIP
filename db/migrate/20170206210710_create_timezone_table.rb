class CreateTimezoneTable < ActiveRecord::Migration[5.0]
  def change
    create_table :timezones do |t|
      t.string :name
    end
  end
end
