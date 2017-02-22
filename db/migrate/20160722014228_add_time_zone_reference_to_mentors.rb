class AddTimeZoneReferenceToMentors < ActiveRecord::Migration[5.0]
  def change
    add_reference :mentors, :mentor_timezone, foreign_key: true
  end
end
