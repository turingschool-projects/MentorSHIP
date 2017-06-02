class Location < ApplicationRecord

  def self.find_by_search_name_or_parse(search_name)
    loc = Location.find_by(search_name: search_name)
    if loc.nil?
      geocode = Geokit::Geocoders::GoogleGeocoder.geocode(search_name)
      return nil if geocode.full_address.nil? || geocode.full_address.empty?
      timezone = Timezone.lookup(geocode.lat, geocode.lng)
      loc = Location.create(search_name: search_name, full_name: geocode.full_address, timezone_name: timezone.name)
    end
    loc
  end
end
