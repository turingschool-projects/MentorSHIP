require 'rails_helper'

describe User, type: :model do

  context "Relationships" do
    it { should have_one(:student)}
    it { should have_one(:mentor)}
  end

end
