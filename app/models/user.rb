class User < ApplicationRecord
  has_one :student
  has_one :mentor

  delegate :avatar,
          :first_name,
          :last_name,
          :email,
          :slack,
          :cohort, to: :census_profile

  def census_profile
    token = "5cd91c71ba86d702504b4bd4d3b3a1126584d4bf09df70b106a6d42bb45a7c75"
    @census_profile ||= CensusProfile.find(census_id, token)
  end

end
