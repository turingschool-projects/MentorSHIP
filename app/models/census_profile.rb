class CensusProfile

  def initialize
    @slack = 0
    @email = 0
    @first_name = 0
    @last_name = 0
    @id = 0
    @avatar = 0
    @cohort = 0
  end

  def self.find(id, token)
    CensusService.new(id).get_user(token)
  end

end
