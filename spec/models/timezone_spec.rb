require 'rails_helper'

RSpec.describe Timezone, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:zone) }
  end
end
