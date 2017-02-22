require 'rails_helper'

RSpec.describe Mentor, type: :model do

  context "Validations" do
    it { should validate_presence_of(:avatar)}
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:phone_number)}
    it { should validate_presence_of(:slack_username)}
    it { should validate_presence_of(:location)}
    it { should validate_presence_of(:mentor_timezone_id)}
    it { should validate_presence_of(:bio)}
    it { should validate_presence_of(:expertise)}
    it { should validate_presence_of(:company)}
    it { should validate_presence_of(:position)}
  end

  context "Uniqueness" do
    it { should validate_uniqueness_of(:email)}
    it { should validate_uniqueness_of(:phone_number)}
    it { should validate_uniqueness_of(:slack_username)}
  end

end

# context "Relationships" do
#   it { should have_many(:comments) }
# end
