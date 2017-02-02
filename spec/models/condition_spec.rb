require_relative '../spec_helper'
require_relative 'test_data_module'
require 'pry'


RSpec.describe Condition do

  describe ".high_temperature_range" do
    it "returns a hash of values broken down by day" do

    station_1 = Station.create(name: "Station1", dock_count: 5, city: City.create(name:"San Francisco"), installation_date: "2013-03-10")
    station_2 = Station.create(name: "Station2", dock_count: 5, city: City.create(name:"San Francisco"), installation_date: "2013-05-02")
    station_3 = Station.create(name: "Station3", dock_count: 5, city: City.create(name:"San Francisco"), installation_date: "2013-06-12")

    trip1 = Trip.create(duration:       20,
                         start_date:      "8/29/2013",
                         start_station_id: 6,
                         end_date:        "8/29/2013",
                         end_station_id:   2,
                         bike_id:          12,
                         subscription_id:  1,
                        )
    trip2 = Trip.create(duration:         10,
                          start_date:       "11/16/2013",
                          start_station_id: 4,
                          end_date:         "11/16/2013",
                          end_station_id:   3,
                          bike_id:          12,
                          subscription_id:  2,
                        )
    trip3 = Trip.create(duration:         10,
                          start_date:       "12/6/2013",
                          start_station_id: 4,
                          end_date:         "12/6/2013",
                          end_station_id:   3,
                          bike_id:          2,
                          subscription_id:  2,
                         )

    weather_1 = Condition.create(date: "8/29/2013",
                max_temperature: 74,
                min_temperature: 61,
                mean_temperature: 68,
                mean_humidity: 75,
                mean_visibility: 10,
                mean_wind_speed: 11,
                precipitation: 0,
                zipcode: 94107)
    weather_2 = Condition.create(date: "11/16/2013",
                max_temperature: 62,
                min_temperature: 49,
                mean_temperature: 56,
                mean_humidity: 67,
                mean_visibility: 10,
                mean_wind_speed: 14,
                precipitation: 0,
                zipcode: 94107)
      weather_3 = Condition.create(date: "12/6/2013",
                max_temperature: 53,
                min_temperature: 37,
                mean_temperature: 45,
                mean_humidity: 65,
                mean_visibility: 10,
                mean_wind_speed: 9,
                precipitation: 0.29,
                zipcode: 94107)

    expected = Condition.high_temperature_range(50, 60)
    return_data = ""

    expect(expected).to eq(return_data)
    end
  end

end

