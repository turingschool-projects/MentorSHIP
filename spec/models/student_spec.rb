require 'rails_helper'

RSpec.describe Student, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:cohort) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:cohort_id) }
  end

  describe "profile_completed" do
    it "defaults to false when created" do
      student = create(:student)

      expect(student.profile_completed).to be(false)
    end
  end
end
