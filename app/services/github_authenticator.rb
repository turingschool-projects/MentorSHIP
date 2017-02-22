require "net/http"
require "net/https"

class GithubAuthenticator
  GITHUB_OAUTH_PATH = "https://github.com/login/oauth/access_token"

  def initialize(auth_code)
    @auth_code = auth_code
  end

  def name
    github_user[:login]
  end

  private

  def github_user
    @github_user ||= github_client.user
  end

  def github_client
    Ocktokit::Client.new(access_token: access_token)
  end

  def access_token
    github_response["access_token"]
  end

  def token_type
    github_response["token_type"]
  end

  def scope
    github_response["scope"]
  end

  def github_response
    @github_response ||= JSON.parse(res.body)
  end

  def res
    http.request(req)
  end

  def req
    req = Net::HTTP::Post.new(uri.path)
    req.set_form_data(post_data)
    req["Accept"] = "application/json"
    req
  end

  def http
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http
  end

  def uri
    URI.parse(GITHUB_OAUTH_PATH)
  end

  def post_data
    {
      "client_id" => ENV["GITHUB_KEY"],
      "client_secret" => ENV["GITHUB_SECRET"],
      "code" => @auth_code
    }
  end
end
