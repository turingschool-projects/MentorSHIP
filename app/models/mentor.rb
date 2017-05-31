class Mentor < ApplicationRecord
  belongs_to :timezone
  belongs_to :user

  has_many :mentor_skills
  has_many :skills, through: :mentor_skills

  delegate :avatar,
           :first_name,
           :last_name,
           :email,
           :phone,
           :slack,
           :bio,
           :census_id,
           :token,
           :account_url,
           :last_active, to: :user


  def profile
    attr_list = [
      :account_url, :active, :avatar, :bio, :company, :email,
      :expertise, :first_name, :gender, :last_name, :location,
      :position, :profile_complete, :slack
    ]

    attr_list.reduce({}) do |profile, attr|
      profile.merge!({attr => self.send(attr)})
    end
  end

  def determine_timezone
    loc = Geokit::Geocoders::GoogleGeocoder.geocode(location)
    loc.precision == 'unknown' ? nil : Timezone.lookup(loc.lat, loc.lng)
  end

end
