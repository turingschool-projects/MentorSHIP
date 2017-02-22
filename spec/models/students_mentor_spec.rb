require 'rails_helper'

RSpec.describe StudentsMentor, type: :model do

  context "Relationships" do
    it { should belong_to(:students)}
    it { should belong_to(:mentors)}
  end

end
