require 'rails_helper'

RSpec.describe Mentor, type: :model do
  it { should belong_to(:timezone) }
  it { should belong_to(:user) }
end
