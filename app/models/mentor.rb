class Mentor < ApplicationRecord
  belongs_to :timezone
  belongs_to :user

  validates :position, presence: true

  # delegate :avatar,
  #          :first_name,
  #          :last_name,
  #          :email,
  #          :phone,
  #          :slack,
  #          :bio,
  #          :census_id,
  #          :token,
  #          :last_active, to: :user
end
