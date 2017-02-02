require_relative '../../spec_helper'

RSpec.describe "when user visits trips path" do
  it "user can view all trips" do
    station_one = Station.create(name: "Station1", dock_count: 5, city: City.create(name:"San Francisco"), installation_date: "2013-03-10")
    station_two = Station.create(name: "Station2", dock_count: 5, city: City.create(name:"San Francisco"), installation_date: "2013-05-02")
    station_three = Station.create(name: "Station3", dock_count: 5, city: City.create(name:"San Francisco"), installation_date: "2013-06-12")

    trip_one = Trip.create(duration:         67,
                       start_date:       "2013/01/01 12:00",
                       start_station: station_one,
                       end_date:         "2005/06/23 16:31",
                       end_station:   station_two,
                       bike_id:          12,
                       subscription_id:  1,
                       zipcode:           87877
                      )
    trip_two = Trip.create(duration:         82,
                       start_date:       "2013/05/12 12:00",
                       start_station: station_two,
                       end_date:         "2005/06/30 16:31",
                       end_station:   station_three,
                       bike_id:          17,
                       subscription_id:  2,
                       zipcode:           87854
                      )
    trip_three = Trip.create(duration:         75,
                       start_date:       "2013/02/14 12:00",
                       start_station:   station_three,
                       end_date:         "2005/02/15 16:31",
                       end_station:     station_one,
                       bike_id:          7,
                       subscription_id:  1,
                       zipcode:           87898
                      )

    visit '/trips'

    expect(page).to have_content(trip_one.duration)
    # expect(page).to have_content(trip_two.end_date)
    expect(page).to have_content(trip_three.bike_id)
  end
end
