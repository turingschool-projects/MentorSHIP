class CreateMentors < ActiveRecord::Migration[5.0]
  def change
    create_table :mentors do |t|
      t.references :timezone, foreign_key: true
      t.string :expertise
      t.string :location
      t.string :company
      t.string :position
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
