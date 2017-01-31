require_relative '../spec_helper'
require 'pry'

RSpec.describe Station do
  describe 'validations' do
    it "is invalid without all attributes" do
      station_1 = Station.create(name: "Station1", dock_count: 20, city_id: 6)
      station_2 = Station.create(name: "Station2", dock_count: 30, installation_date: "2016-02-06")

      expect(station_1).to_not be_valid
      expect(station_2).to_not be_valid
    end
  end

  describe 'validations' do
    it "is invalid without a name" do
      station = Station.create(dock_count: 5, city_id: 6, installation_date: "2016-02-05")

      expect(station).to_not be_valid
    end
  end

  describe 'validations' do
    it "is invalid without a dock count" do
      station = Station.create(name: "Station1", dock_count: 2, installation_date: "2014-09-04")
      expect(station).to_not be_valid
    end
  end

  describe 'validations' do
    it "is invalid without a city" do
      station = Station.create(name: "Station1", dock_count: 1, installation_date: "2015-10-02")
      expect(station).to_not be_valid
    end
  end

  describe 'validations' do
    it "is invalid without an installation_date" do
      station = Station.create(name: "Station1", dock_count: 5, city_id: 4)

      expect(station).to_not be_valid
    end
  end

  describe 'validations' do
    it "is valid with all attributes" do
      station = Station.create(name: "Station1", dock_count: 3, city_id: 3, installation_date: "2015-03-21")

      expect(station).to be_valid
    end
  end

  describe '.total_stations' do
    it "returns total stations" do
      oakland = City.create(name: "Oakland")
      denver  = City.create(name: "Denver")

      denver.stations.create(name: "Station1", dock_count: 10, installation_date: "2013-03-10")
      oakland.stations.create(name: "Station2", dock_count: 5, installation_date: "2013-02-08")
      denver.stations.create(name: "Station3", dock_count: 7, installation_date: "2011-05-14")

      expect(Station.total_stations).to eq(3)
    end
  end

  describe '.average_bikes_per_station' do
    it "returns average bikes per station" do
      san_francisco = City.create(name: "San Francisco")

      san_francisco.stations.create(name: "Station1", dock_count: 15, installation_date: "2013-03-10")
      san_francisco.stations.create(name: "Station1", dock_count: 5, installation_date: "2013-03-10")

      expected = Station.average_bikes_per_station.to_i
      expect(expected).to eq(10)
    end
  end

  describe '.max_bikes' do
    it "returns maximum bikes per station" do
      san_francisco = City.create(name: "San Francisco")

      san_francisco.stations.create(name: "Station1", dock_count: 15, installation_date: "2003-03-10")
      san_francisco.stations.create(name: "Station2", dock_count:30, installation_date: "2012-05-10")
      san_francisco.stations.create(name: "Station4", dock_count:10, installation_date: "2013-03-13")

      expect(Station.max_bikes).to eq(30)
    end
  end

  describe '.station_with_most_bikes' do
    it "returns 10 stations with most bikes" do
      san_francisco = City.create(name: "San Francisco")
      oakland       = City.create(name: "Oakland")
      berkeley      = City.create(name: "Berkeley")


      san_francisco.stations.create(name: "Station1", dock_count: 5, installation_date: "2013-03-10")
      oakland.stations.create(name: "Station2", dock_count: 10, installation_date: "2013-05-02")
      berkeley.stations.create(name: "Station3", dock_count: 10, installation_date: "2013-06-12")
      san_francisco.stations.create(name: "Station4", dock_count: 7, installation_date: "2013-03-10")

      result = Station.stations_with_most_bikes

      expect(result.first.name).to eq("Station2")
      expect(result.last.name).to eq("Station3")
    end
  end

    describe '.fewest_bikes' do
    it "returns fewest_bikes" do
      san_francisco = City.create(name: "San Francisco")
      oakland       = City.create(name: "Oakland")
      berkeley      = City.create(name: "Berkeley")

      san_francisco.stations.create(name: "Station1", dock_count: 5, installation_date: "2013-03-10")
      oakland.stations.create(name: "Station2", dock_count: 7, installation_date: "2013-05-02")
      berkeley.stations.create(name: "Station3", dock_count: 10, installation_date: "2013-06-12")
      result = Station.fewest_bikes
      expect(result).to eq(5)
    end
  end

  describe '.oldest_station' do
    it "returns oldest station" do
      Station.create(name: "Station1", dock_count: 5, city: City.create(name:"San Francisco"), installation_date: "2013-03-10")
      Station.create(name: "Station2", dock_count: 5, city: City.create(name:"San Francisco"), installation_date: "2013-05-02")
      Station.create(name: "Station3", dock_count: 5, city: City.create(name:"San Francisco"), installation_date: "2013-06-12")
      result = Station.oldest_station

      expect(result.name).to eq("Station1")

    end
  end

  describe '.newest_station' do
    it "returns newest station" do
      Station.create(name: "Station1", dock_count: 5, city: City.create(name:"San Francisco"), installation_date: "2013-03-10")
      Station.create(name: "Station2", dock_count: 5, city: City.create(name:"San Francisco"), installation_date: "2013-05-02")
      Station.create(name: "Station3", dock_count: 5, city: City.create(name:"San Francisco"), installation_date: "2013-06-12")
      result = Station.newest_station

      expect(result.name).to eq("Station3")
    end
  end

  describe '.average_bikes_per_station' do
    it "returns average bikes per station" do
      san_francisco = City.create(name: "San Francisco")

      san_francisco.stations.create(name: "Station1", dock_count: 15, installation_date: "2013-03-10")
      san_francisco.stations.create(name: "Station1", dock_count: 5, installation_date: "2013-03-10")

      expected = Station.average_bikes_per_station.to_i
      expect(expected).to eq(10)
    end
  end

  describe '.most_frequent_bike_id' do
    it "returns most_frequent_starting_bikes per station" do
      mission = Station.create(name: "Mission", dock_count: 5, city: City.create(name:"San Francisco"), installation_date: "2013-03-10")
      bike1 = Bike.create(given_id: 1)
      bike2 = Bike.create(given_id: 2)
      bike3= Bike.create(given_id: 3)

      trip1 = Trip.create(duration:       60,
                         start_date:      "2013/01/01 12:00",
                         start_station_id: 4,
                         end_date:        "2005/06/23 16:31",
                         end_station_id:   2,
                         bike_id:          3,
                         subscription_id:  1,
                        )
      trip2 = Trip.create(duration:         20,
                          start_date:       "2005/01/01 12:00",
                          start_station_id: 4,
                          end_date:         "2013/08/06 12:00",
                          end_station_id:   3,
                          bike_id:          3,
                          subscription_id:  2,
                        )
      trip3 = Trip.create(duration:         30,
                          start_date:       "2005/04/03 15:00",
                          start_station_id: 4,
                          end_date:         "2005/04/03 17:00",
                          end_station_id:   6,
                          bike_id:          1,
                          subscription_id:  2,
                        )

      expected = mission.most_frequent_bike_id(trip1, bike1)
      expect(expected).to eq(2)
    end
  end

  describe '.most_frequent_destination' do
    it "returns most_frequent_destination per station" do
      mission = Station.create(name: "Mission", dock_count: 5, city: City.create(name:"San Francisco"), installation_date: "2013-03-10")
      trip1 = Trip.create(duration:       60,
                         start_date:      "2013/01/01 12:00",
                         start_station_id: 4,
                         end_date:        "2005/06/23 16:31",
                         end_station_id:   2,
                         bike_id:          12,
                         subscription_id:  1,
                        )
      trip2 = Trip.create(duration:         20,
                          start_date:       "2005/01/01 12:00",
                          start_station_id: 4,
                          end_date:         "2013/08/06 12:00",
                          end_station_id:   2,
                          bike_id:          7,
                          subscription_id:  2,
                        )
      trip3 = Trip.create(duration:         30,
                          start_date:       "2005/04/03 15:00",
                          start_station_id: 4,
                          end_date:         "2005/04/03 17:00",
                          end_station_id:   6,
                          bike_id:          5,
                          subscription_id:  2,
                        )

      expected = mission.most_frequent_destination(trip1)
      expect(expected).to eq(2)
    end
  end

  describe '.date_with_most_trips' do
    it "returns date with most starting trips per station" do
      mission = Station.create(name: "Mission", dock_count: 5, city: City.create(name:"San Francisco"), installation_date: "2013-03-10")
      trip1 = Trip.create(duration:       60,
                         start_date:      "2013/03/01 12:00",
                         start_station_id: 4,
                         end_date:        "2005/03/01 16:31",
                         end_station_id:   2,
                         bike_id:          12,
                         subscription_id:  1,
                        )
      trip2 = Trip.create(duration:         20,
                          start_date:       "2013/03/01 12:00",
                          start_station_id: 4,
                          end_date:         "2013/03/02 12:00",
                          end_station_id:   3,
                          bike_id:          7,
                          subscription_id:  2,
                        )
      trip3 = Trip.create(duration:         30,
                          start_date:       "2015/04/03 15:00",
                          start_station_id: 4,
                          end_date:         "2015/04/03 17:00",
                          end_station_id:   6,
                          bike_id:          5,
                          subscription_id:  2,
                        )

      expected = mission.date_with_most_trips(trip1)
      expect(expected).to eq("2013/03/01 12:00")
    end
  end

  describe '.most_frequent_zipcode' do
    it "returns most frequent zipcode per station" do
      mission = Station.create(name: "Mission", dock_count: 5, city: City.create(name:"San Francisco"), installation_date: "2013-03-10")
      trip1 = Trip.create(duration:       60,
                         start_date:      "2013/03/03 12:00",
                         start_station_id: 4,
                         end_date:        "2005/03/03 16:31",
                         end_station_id:   2,
                         bike_id:          12,
                         subscription_id:  1,
                         zipcode:          87757
                        )
      trip2 = Trip.create(duration:         20,
                          start_date:       "2013/03/07 12:00",
                          start_station_id: 4,
                          end_date:         "2013/03/08 12:00",
                          end_station_id:   3,
                          bike_id:          7,
                          subscription_id:  2,
                          zipcode:          87891
                        )
      trip3 = Trip.create(duration:         30,
                          start_date:       "2015/04/03 15:00",
                          start_station_id: 4,
                          end_date:         "2015/04/03 17:00",
                          end_station_id:   6,
                          bike_id:          5,
                          subscription_id:  2,
                          zipcode:          87757
                        )

      expected = mission.most_frequent_zipcode(trip1)
      expect(expected).to eq(87757)
    end
    
  describe '.rides_started_at_station' do
    it "returns rides started at station" do
      station1 = Station.create!(name: "Station1", dock_count: 5, city: City.create(name:"San Francisco"), installation_date: "2013-03-10")
      trip1 = Trip.create!(duration: 7, start_date: "2013-05-16", start_station_id: 1, end_date: "2013-05-16", end_station_id: 2, bike_id: 3, subscription_id: 2)

      expect(station1.rides_started_at_station(trip1)).to eq(1)
      end
  end

    describe '.rides_ended_at_station' do
    it "returns rides ended at station" do
      station1 = Station.create!(name: "Station1", dock_count: 5, city: City.create(name:"San Francisco"), installation_date: "2013-03-10")
      trip1 = Trip.create!(duration: 7, start_date: "2013-05-16", start_station_id: 1, end_date: "2013-05-16", end_station_id: 2, bike_id: 3, subscription_id: 2)

      expect(station1.rides_ended_at_station(trip1)).to eq(1)
      end
  end

end
