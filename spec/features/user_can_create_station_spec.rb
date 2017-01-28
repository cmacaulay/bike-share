require_relative '../spec_helper'

RSpec.describe "when user visits new station path" do
  it "user can create new station" do

    Station.create(name: "Station1", dock_count: 2, city: "Auckland", installation_date: "2015-09-06")

    visit('/stations/new')

    fill_in 'station[name]', with: "Station1"
    fill_in 'station[dock_count]', with: 2
    fill_in 'station[city]', with: "Auckland"
    fill_in 'station[installation_date]', with: "2015-09-06"

    click_on 'Create New Station'

    station = Station.last
    expect(station.name).to eq("Station1")
    expect(page).to have_content("Auckland")
    expect(current_path).to eq("/stations/#{station.id}")
    save_and_open_page
  end
end
