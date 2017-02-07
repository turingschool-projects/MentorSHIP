require 'rails_helper'

describe Timezone, type: :model do

  context "Validations" do
    it { should validate_presence_of(:name) }
  end

  context "Relationships" do
    it { should have_many(:users) }
  end

end
