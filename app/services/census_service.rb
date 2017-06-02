class CensusService

  def initialize(token)
    url = "#{ENV["CENSUS_URL"]}/api/v1"

    @conn = Faraday.new(url: url) do |faraday|

      faraday.adapter  Faraday.default_adapter
      faraday.params[:access_token] = token
    end
  end

  def get_user(id)
    response = conn.get("users/#{id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def update_census(id, params)
    @conn.put("users/#{id}", params.to_json)
  end

  def get_all_users
    response = @conn.get("users?access_token=#{ENV['CENSUS_ACCESS_TOKEN']}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    attr_reader :token, :conn
end
