require_relative '../../spec_helper'

RSpec.describe "when a user visits a trip path" do
  it "user can edit a trip" do
    station_one = Station.create(name: "Station1", dock_count: 5, city: City.create(name:"San Francisco"), installation_date: "2013-03-10")
    station_two = Station.create(name: "Station2", dock_count: 5, city: City.create(name:"San Francisco"), installation_date: "2013-05-02")

    trip = Trip.create(duration:         67,
                       start_date:       "2013/01/01 12:00",
                       start_station:   station_one,
                       end_date:         "2005/06/23 16:31",
                       end_station:     station_two,
                       bike_id:          12,
                       subscription_id:  1,
                       zipcode:           87877
                      )
    # binding.pry
    visit "/trips/#{trip.id}/edit"

    # save_and_open_page
    fill_in 'trip[duration]', with: 45
    fill_in 'trip[start_date]', with: "2015/03/02 15:00"
    select "Station2", from: 'trip[start_station_id]'
    fill_in 'trip[end_date]', with: "2015/03/02 16:31"
    select 'Station1', from: 'trip[end_station_id]'
    fill_in 'trip[bike_id]', with: 14
    fill_in 'trip[subscription_id]', with: 2
    fill_in 'trip[zipcode]', with: 87878

    click_on 'Submit Changes'

    trip = Trip.last
    expect(trip.duration).to eq(45)
    expect(page).to have_content(14)
    expect(current_path).to eq("/trips/#{trip.id}")

  end
end
