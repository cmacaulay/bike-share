require_relative '../../spec_helper'

RSpec.describe "when a user visit new trip path" do
  it "user can create a new trip" do

    visit('/trips/new')

    fill_in 'trip[duration]', with: 67
    fill_in 'trip[start_date]', with: "2013/01/01 12:00"
    fill_in 'trip[end_date]', with: "2005/06/23 16:31"
    fill_in 'trip[start_station_id]', with: 6
    fill_in 'trip[end_station_id]', with: 2
    fill_in 'trip[bike_id]', with: 12
    fill_in 'trip[subscription_id]', with: 1
    fill_in 'trip[zipcode]', with: 80222

    click_on 'Create New Trip'
    trip = Trip.last

    expect(trip.start_date).to eq("2013/01/01 12:00")
    expect(page).to have_content(12)
    expect(current_path).to eq("/trips/#{trip.id}")
  end
end
