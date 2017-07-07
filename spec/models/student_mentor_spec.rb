require 'rails_helper'

RSpec.describe StudentMentor, type: :model do
  context "Relationships" do
    it { should belong_to(:mentor) }
    it { should belong_to(:student) }
  end
end
