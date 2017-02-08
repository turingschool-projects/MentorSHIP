Rails.application.config.middleware.use OmniAuth::Builder do

  provider :census, ENV["CENSUS_ID"], ENV["CENSUS_SECRET"], {
    :name => "census"
  }
end
