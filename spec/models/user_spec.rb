require 'rails_helper'

describe User, type: :model do

  context "Relationships" do
    it { should belong_to(:timezone) }
  end

end
