require 'rails_helper'

RSpec.describe Student, type: :model do
  describe "profile_completed" do
    it "defaults to false when created" do
      student = create(:student)

      expect(student.profile_completed).to be(false)
    end
  end
end
