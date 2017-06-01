Timezone::Lookup.config(:geonames) do |c|
  c.username = ENV['GEONAMES_USERNAME']
end

Timezone::Lookup.config(:google) do |c|
  c.api_key = ENV['GOOGLE_API_KEY']
end