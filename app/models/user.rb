class User < ApplicationRecord
  has_one :student
  has_one :mentor

  delegate :avatar,
           :first_name,
           :last_name,
           :email,
           :slack,
           :cohort, to: :census_profile
end
