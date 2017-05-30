class User < ApplicationRecord
  has_one :student
  has_one :mentor

  delegate :avatar,
          :first_name,
          :last_name,
          :email,
          :slack,
          :cohort, to: :census_profile

  def census_profile
    token = ENV['CENSUS_ACCESS_TOKEN']
    @census_profile ||= CensusProfile.find(census_id, token)
  end


  def mentor_profile
    Mentor.create(user: self) if self.mentor.nil?

    directory = {
      mentor => [:expertise, :company, :position, :active, :profile_complete, :gender, :location],
      census_profile => [:avatar, :email, :first_name, :last_name, :slack, :account_url],
      self => [:bio]
    }

    directory.reduce({}) do |profile, (user_class, attr_list)|
      attr_list.each do |attr|
        profile[attr] = user_class.send(attr)
      end
      profile
    end
  end

end
