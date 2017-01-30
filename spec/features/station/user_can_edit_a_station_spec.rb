require_relative '../../spec_helper'

RSpec.describe "when user visits edit station path" do
  it "user can edit a station" do
    City.create(name: "Aukland")
    boulder = City.create(name: "Boulder")
    station = boulder.stations.create(name: "Max Station", dock_count: 4, installation_date: "2005-07-09")

    visit("/stations/#{station.id}/edit")

    fill_in 'station[name]', with: "Amara Station"
    fill_in 'station[dock_count]', with: 6
    select  "Auckland", from: 'station[city_id]'
    fill_in 'station[installation_date]', with: "2016-04-08"

    click_on 'Submit Changes'

    station = Station.find_by(name: "Amara Station")
    expect(station.dock_count).to eq(6)
    expect(page).to have_content("Denver")
    expect(current_path).to eq("/stations/#{station.id}")
  end
end
