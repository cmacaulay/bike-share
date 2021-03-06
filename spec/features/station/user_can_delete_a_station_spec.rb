require_relative '../../spec_helper'

RSpec.describe "when user visits a station path" do
  it "user can delete a station" do
    boulder = City.create(name: "Boulder")

    station = boulder.stations.create(name: "Casey Station", dock_count: 3, installation_date: "2014-10-10")

    visit("/stations/#{station.id}")

    expect {click_on 'Delete Station'}.to change(Station.all, :count).by(-1)
    expect(page).to_not have_content(station.name)
    expect(current_path).to eq("/stations")
  end
end
