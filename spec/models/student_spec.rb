require 'rails_helper'

RSpec.describe Student, type: :model do
  context "Relationships" do
    it { should belong_to(:user)}
  end

  context "Delegations" do
    it { should delegate_method(:avatar).to(:user) }
    it { should delegate_method(:first_name).to(:user) }
    it { should delegate_method(:last_name).to(:user) }
    it { should delegate_method(:phone).to(:user) }
    it { should delegate_method(:email).to(:user) }
    it { should delegate_method(:slack).to(:user) }
    it { should delegate_method(:bio).to(:user) }
    it { should delegate_method(:last_active).to(:user) }
    it { should delegate_method(:census_id).to(:user) }
    it { should delegate_method(:token).to(:user) }
    it { should delegate_method(:cohort).to(:user) }

  end

end
