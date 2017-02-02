class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :avatar
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :slack_username
      t.string :bio
      t.datetime :last_active

      t.timestamps
    end
  end
end
