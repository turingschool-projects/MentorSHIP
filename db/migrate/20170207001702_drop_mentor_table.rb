class DropMentorTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :mentors
  end
end
