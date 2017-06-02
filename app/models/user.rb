class User < ApplicationRecord
  has_one :student
  has_one :mentor

  delegate :avatar,
           :first_name,
           :last_name,
           :email,
           :slack,
           :account_url,
           :cohort, to: :census_profile

  def census_profile
    token = ENV['CENSUS_ACCESS_TOKEN']
    @census_profile ||= CensusProfile.find(census_id, token)
  end
end
