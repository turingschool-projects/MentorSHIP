class CreateSkillTable < ActiveRecord::Migration[5.0]
  def change
    create_table :skills do |t|
      t.string :name, null: false
      t.integer :skill_type, null: false
    end
  end
end
