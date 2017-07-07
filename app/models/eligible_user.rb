class EligibleUser

  def self.eligible_users
    eligible_roles = ["mentor", "admin", "staff", "graduated"]
    all_users = CensusService.new(ENV['CENSUS_ACCESS_TOKEN']).get_all_users

    eligible_users = all_users.map do |user|
      unless user.nil? || user[:roles].empty?
        if eligible_roles.include?(user[:roles][0][:name])
          user[:id]
        end
      end
    end
    return eligible_users
  end
end
