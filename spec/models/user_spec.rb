require 'rails_helper'

describe User, type: :model do

  context "Relationships" do
    it { should have_one(:student)}
    it { should have_one(:mentor)}
  end

  context "Delegations" do
    it { should delegate_method(:avatar).to(:census_profile) }
    it { should delegate_method(:first_name).to(:census_profile) }
    it { should delegate_method(:last_name).to(:census_profile) }
    it { should delegate_method(:email).to(:census_profile) }
    it { should delegate_method(:slack).to(:census_profile) }
    it { should delegate_method(:cohort).to(:census_profile) }

  end

end
