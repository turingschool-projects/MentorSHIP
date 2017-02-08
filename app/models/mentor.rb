class Mentor < ApplicationRecord
  belongs_to :timezone
  belongs_to :user
end
