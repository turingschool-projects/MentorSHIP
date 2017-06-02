require "rails_helper"

RSpec.describe MentorSkill, type: :model do
  context "Relationships" do
    it { should belong_to :skill }
    it { should belong_to :mentor }
  end
end
