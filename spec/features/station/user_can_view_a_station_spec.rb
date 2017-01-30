require_relative '../../spec_helper'

RSpec.describe "when user visits one station path" do
  it "user can see a station" do
    station = Station.record(name: "Amara Station", dock_count: 4, city_name: "Denver", installation_date: "2014-06-07")

    visit("/stations/#{station.id}")

    expect(page).to have_content("Amara Station")
    expect(page).to have_content("Denver")
    expect(page).to have_content(4)
  end

  it "user gets redirected to edit when Edit Station is selected" do
    station = Station.record(name: "Cody Station", dock_count: 7, city_name: "Denver", installation_date: "2015-07-21")

    visit("/stations/#{station.id}")

    click_link("Edit Station")
    expect(current_path).to eq("/stations/#{station.id}/edit")
  end
end
