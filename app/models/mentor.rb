class Mentor < ApplicationRecord
  belongs_to :timezone
  belongs_to :user

  delegate :image_url,
           :first_name,
           :last_name,
           :email,
           :phone,
           :slack,
           :bio,
           :census_id,
           :token,
           :last_active, to: :user
end
