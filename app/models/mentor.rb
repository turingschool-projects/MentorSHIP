class Mentor < ApplicationRecord
  before_save :declare_timezone

  belongs_to :timezone
  belongs_to :user

  validates :position, presence: true

  # delegate :avatar,
  #          :first_name,
  #          :last_name,
  #          :email,
  #          :phone,
            #:slack,
  #          :bio,
  #          :census_id,
  #          :token,
  #          :last_active, to: :user

  def declare_timezone
    Timezone.find_or_create_by(name: name) do |f|
      f.name = name
    end
  end
end
