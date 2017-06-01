class RemoveTimezoneReferenceFromMentors < ActiveRecord::Migration[5.0]
  def change
    remove_reference :mentors, :timezone, index: true, foreign_key: true
  end
end
