class CreateFavoriteMentors < ActiveRecord::Migration[5.0]
  def change
    create_table :favorite_mentors do |t|
      t.references :user, foreign_key: true
      t.references :mentor, foreign_key: true
    end
  end
end
