require 'rails_helper'

RSpec.describe CensusProfile do
  it "#find" do
    hash     = {slack: "derp", first_name: "Heili", last_name: "Derpi", avator: "www.poop.com/derp", cohort: "1611"}
    allow_any_instance_of(CensusService).to_receive(:get_user).and_return(hash)
    profile  = CensusProfile.new(1337)
    found    = CensusProfile.find(profile)

    expect().to eq()
  end
end
