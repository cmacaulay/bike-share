require_relative '../../spec_helper'

RSpec.describe "when user visits stations path" do
  it "user view all stations" do
    station_one = Station.create(name: "Station1", dock_count: 3, city: City.create(name: "Auckland"), installation_date: "2015-10-22")
    station_two = Station.create(name: "Station2", dock_count: 5, city: City.create(name: "San Francisco"), installation_date: "2014-02-10")
    station_three = Station.create(name: "Station3", dock_count: 1, city: City.create(name: "San Bernadino"), installation_date: "2016-10-08")

    visit('/stations')

    expect(page).to have_content(station_one.name)
    expect(page).to have_content(station_two.dock_count)
    expect(page).to have_content(station_three.city.name)
    expect(page).to have_content(station_three.installation_date)
  end
end
