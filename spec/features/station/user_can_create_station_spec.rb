require_relative '../../spec_helper'

RSpec.describe "when user visits new station path" do
  it "user can create new station" do
    City.create(name: "Auckland")

    visit('/stations/new')

    fill_in 'station[name]', with: "Station1"
    fill_in 'station[dock_count]', with: 2
    select  "Auckland", from: 'station[city_id]'

    fill_in 'station[installation_date]', with: "2015-09-06"

    click_on 'Create New Station'
    station = Station.last

    expect(station.name).to eq("Station1")
    expect(page).to have_content("Auckland")
    expect(current_path).to eq("/stations/#{station.id}")
  end
end
