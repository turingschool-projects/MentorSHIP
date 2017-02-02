require 'rails_helper'

RSpec.describe Cohort, type: :model do

  context "Validations" do
    it { should validate_presence_of(:number) }
  end
  
end
