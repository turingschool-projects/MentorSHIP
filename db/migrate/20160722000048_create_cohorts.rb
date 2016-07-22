class CreateCohorts < ActiveRecord::Migration[5.0]
  def change
    create_table :cohorts do |t|
      t.integer :number

      t.timestamps
    end
  end
end
