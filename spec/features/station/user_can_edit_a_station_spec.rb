require_relative '../../spec_helper'

RSpec.describe "when user visits edit station path" do
  it "user can edit a station" do
    station = Station.record(name: "Max Station", dock_count: 4, city_name: "Boulder", installation_date: "2005-07-09")

    visit("/stations/#{station.id}/edit")

    fill_in 'station[name]', with: "Amara Station"
    fill_in 'station[dock_count]', with: 6
    fill_in 'station[city_name]', with: "Denver"
    fill_in 'station[installation_date]', with: "2016-04-08"

    click_on 'Submit Changes'

    station = Station.last
    expect(station.dock_count).to eq(6)
    expect(page).to have_content("Denver")
    expect(current_path).to eq("/stations/#{station.id}")
  end
end
