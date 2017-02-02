class CreateMentors < ActiveRecord::Migration[5.0]
  def change
    create_table :mentors do |t|
      t.string :avatar
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :slack_username
      t.string :location
      t.string :bio
      t.string :expertise
      t.string :company
      t.string :position
      t.datetime :last_active

      t.timestamps
    end
  end
end
