class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :phone
      t.string :location
      t.references :timezone, foreign_key: true
      t.string :bio
      t.string :expertise
      t.string :company
      t.string :position
      t.datetime :last_active
      t.integer :token

      t.timestamps
    end
  end
end
