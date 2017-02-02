require 'rails_helper'

RSpec.describe Student, type: :model do

  context "Validations" do
    it { should validate_presence_of(:avatar)}
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:phone_number)}
    it { should validate_presence_of(:slack_username)}
    it { should validate_presence_of(:bio)}
  end

  context "Uniqueness" do
    it{ should validate_uniqueness_of(:email)}
    it{ should validate_uniqueness_of(:phone_number)}
    it{ should validate_uniqueness_of(:slack_username)}
  end

end
