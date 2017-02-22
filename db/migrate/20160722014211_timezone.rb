class Timezone < ActiveRecord::Migration[5.0]
  def change
    create_table :mentor_timezones do |t|
      t.string :name

      t.timestamps
    end
  end
end
