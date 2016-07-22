class Mentor < ApplicationRecord
  belongs_to :user
  belongs_to :timezone
end
