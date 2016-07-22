class CreateMentors < ActiveRecord::Migration[5.0]
  def change
    create_table :mentors do |t|
      t.references :user, foreign_key: true
      t.string :location

      t.timestamps
    end
  end
end
