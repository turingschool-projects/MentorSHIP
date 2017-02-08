class CensusService

  def initialize(token)
    @token = token
    @connection = Faraday.new()
  end

  def get_user(id)
    {slack: "this", email: "that", first_name: "Nate", last_name: "Allen", id: 1, avatar: "Thing", cohort: 1602}
  end

end
