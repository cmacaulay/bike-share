# require_relative '../../spec_helper'
#
# RSpec.describe "when a user visits a trip path" do
#   it "user can delete a trip" do
#     station_one = Station.create(name: "Station1", dock_count: 5, city: City.create(name:"San Francisco"), installation_date: "2013-03-10")
#     station_two = Station.create(name: "Station2", dock_count: 5, city: City.create(name:"San Francisco"), installation_date: "2013-05-02")
#
#     trip = Trip.create(duration:         67,
#                        start_date:       "2013/01/01 12:00",
#                        start_station_id:   station_one.name,
#                        end_date:         "2005/06/23 16:31",
#                        end_station_id:     station_two.name,
#                        bike_id:          12,
#                        subscription_id:  1,
#                        zipcode:           87877
#                       )
#
#     visit "/trips/#{trip.id}"
#
#     expect {click_on 'Delete Trip'}.to change(Trip.all, :count).by(-1)
#     expect(page).to_not have_content(trip.duration)
#     expect(current_path).to eq("/trips")
#   end
# end
