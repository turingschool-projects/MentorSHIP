class CensusProfile

  attr_reader :slack, :email, :first_name, :last_name, :avatar, :cohort, :id

  def initialize(user_hash)
    @slack = user_hash[:slack]
    @email = user_hash[:email]
    @first_name = user_hash[:first_name]
    @last_name = user_hash[:last_name]
    @avatar = user_hash[:image_url]
    @cohort = user_hash[:cohort]
    @id = user_hash[:id]
  end

  def self.find(id, token)
    user_hash = CensusService.new(token).get_user(id)
    CensusProfile.new(user_hash)
  end

  def account_url
    "#{ENV['CENSUS_URL']}/users/#{id}"
  end
end
