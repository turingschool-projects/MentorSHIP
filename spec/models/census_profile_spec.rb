require 'rails_helper'

RSpec.describe CensusProfile do
  it "#find" do
    a_user   = create(:user)
    hash     = {slack: "derp", email: "derp@derp.io", first_name: "Heili", last_name: "Derpi", cohort: "1611"}
    allow_any_instance_of(CensusService).to receive(:get_user).and_return(hash)
    found    = CensusProfile.find(a_user.id, a_user.token)

    expect(found.slack).to eq("derp")
    expect(found.first_name).to eq("Heili")
    expect(found.last_name).to eq("Derpi")
    expect(found.email).to eq("derp@derp.io")
    expect(found.cohort).to eq("1611")
  end
end
