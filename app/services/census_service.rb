class CensusService

  def initialize(token)
    @token = token
    @connection = Faraday.new()
  end

  def get_user(id)

  end

end
