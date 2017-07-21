class CensusProfile

  attr_reader :slack, :email, :first_name, :last_name, :avatar, :cohort

  def initialize(user_hash)
    @slack = user_hash[:slack]
    @email = user_hash[:email]
    @first_name = user_hash[:first_name]
    @last_name = user_hash[:last_name]
    @avatar = user_hash[:image_url]
    @cohort = user_hash[:cohort]
  end

  def self.find(id, token)
    user_hash = CensusService.new.get_user(id)
    CensusProfile.new(user_hash)
  end

end
