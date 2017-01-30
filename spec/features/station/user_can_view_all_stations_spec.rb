require_relative '../../spec_helper'

RSpec.describe "when user visits stations path" do
  it "user view all stations" do
    station_one = Station.record(name: "Station1", dock_count: 3, city_name: "Auckland", installation_date: "2015-10-22")
    station_two = Station.record(name: "Station2", dock_count: 5, city_name: "San Francisco", installation_date: "2014-02-10")
    station_three = Station.record(name: "Station3", dock_count: 1, city_name: "San Bernardino", installation_date: "2016-10-08")

    visit('/stations')

    expect(page).to have_content(station_one.name)
    expect(page).to have_content(station_two.dock_count)
    expect(page).to have_content(station_three.city.name)
    expect(page).to have_content(station_three.installation_date)
  end
end
