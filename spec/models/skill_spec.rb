require "rail_helper"

RSpec.describe Skill, type: :model do
  context "Relationships" do
    it { should have_many(:mentor_skills) }
    it { should have_many(:mentor) }
  end

  context "Validations" do
    it { should validate_presence_of(:name ) }
    it { should validate_presence_of(:skill_type ) }

    it { should validate_uniquness_of(:name) } 
  end
end
