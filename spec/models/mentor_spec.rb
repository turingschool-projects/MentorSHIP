require 'rails_helper'

RSpec.describe Mentor, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:mentor_timezone) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:mentor_timezone) }
  end

  describe "profile_completed" do
    it "defaults to false when created" do
      mentor = create(:mentor)

      expect(mentor.profile_completed).to be(false)
    end
  end
end
