class Timezone < ActiveRecord::Migration[5.0]
  def change
    create_table :timezones do |t|
      t.string :zone

      t.timestamps
    end
  end
end
