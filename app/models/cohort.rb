class Cohort < ApplicationRecord
  validate :number, presence: true
end
