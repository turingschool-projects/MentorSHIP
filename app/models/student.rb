class Student < ApplicationRecord
  belongs_to :user

  delegate :avatar,
           :first_name,
           :last_name,
           :phone,
           :email,
           :slack,
           :bio,
           :last_active,
           :census_id,
           :token,
           :cohort, to: :user
end
