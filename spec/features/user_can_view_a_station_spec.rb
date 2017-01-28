require_relative '../spec_helper'

RSpec.describe "when user visits one station path" do
  it "user can see a station" do
    station = Station.create(name: "Amara Station", dock_count: 4, city: "Denver", installation_date: "2014-06-07")

    visit("/stations/#{station.id}")

    expect(page).to have_content("Amara Station")
    expect(page).to have_content("Denver")
    expect(page).to have_content(4)
  end
end
