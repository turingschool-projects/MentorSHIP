require 'rails_helper'

RSpec.describe StudentsMentor, type: :model do

  context "Relationships" do
    it { should belong_to(:student)}
    it { should belong_to(:mentor)}
  end

end
