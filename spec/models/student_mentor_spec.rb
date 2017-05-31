require 'rails_helper'

RSpec.describe StudentMentor, type: :model do
  describe "#favorited_mentors" do
    xit "brings back mentors where favorite is true" do

    end
  end

  context "Relationships" do
    it { should belong_to(:mentor) }
    it { should belong_to(:student) }
  end
end
