require "rails_helper"

RSpec.describe Skill, type: :model do
  context "Relationships" do
    it { should have_many(:mentor_skills) }
    it { should have_many(:mentors) }
  end

  context "Validations" do
    before(:each) do
      @skill = Skill.create!(name: "Ruby", skill_type: 1)
    end
    subject{ @skill }

    it { should validate_presence_of(:name ) }
    it { should validate_presence_of(:skill_type ) }
    it { should validate_uniqueness_of(:name) }
  end

  context "Process" do
    it { should define_enum_for(:skill_type) }
  end
end
