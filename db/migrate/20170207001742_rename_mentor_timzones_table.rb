class RenameMentorTimzonesTable < ActiveRecord::Migration[5.0]
  def change
    rename_table :mentor_timezones, :timezones
  end
end
