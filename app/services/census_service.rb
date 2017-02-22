class CensusService

  def initialize(token)
    @conn = Faraday.new(url: "https://census-app-staging.herokuapp.com/api/v1/") do |faraday|
      faraday.adapter  Faraday.default_adapter
      faraday.params[:access_token] = token
    end
  end

  def get_user(id)
    response = conn.get("users/#{id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def update_census(id, params)
    @conn.put("users/#{id}", params)
  end

  private
  attr_reader :token, :conn


end
