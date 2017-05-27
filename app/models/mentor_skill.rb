class MentorSkill < ApplicationRecord
  belongs_to :skill
  belongs_to :mentor
end
