class CensusService

  def initialize
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
    @conn.put("users/#{id}", params.to_json)
  end

  private
    attr_reader :conn


    def token
      Rails.cache.fetch(:census_token, expires_in: 89.days) do
        conn = Faraday.new(url: "https://census-app-staging.herokuapp.com")
        response = conn.post do |req|
          req.url '/oauth/token'
          req.params['grant_type'] = 'client_credentials'
          req.params['client_id'] = ENV['CENSUS_ID'] #=> provided by census interface
          req.params['client_secret'] = ENV['CENSUS_SECRET'] #=> provided by census interface
        end
        JSON.parse(response.body)['access_token']
      end
    end

end
