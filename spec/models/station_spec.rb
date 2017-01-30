require_relative '../spec_helper'
RSpec.describe Station do
  describe 'validations' do
    it "is invalid without all attributes" do

      station_1 = Station.record(name: "Station1", dock_count: 20, city_name: "San Francisco")
      station_2 = Station.record(name: "Station2", dock_count: 30, installation_date: "2016-02-05")
      expect(station_1).to_not be_valid
      expect(station_2).to_not be_valid
    end
  end

  describe 'validations' do
    it "is invalid without a name" do
      station = Station.record(dock_count: 5, city_name: "Denver", installation_date: "2016-02-05")
      expect(station).to_not be_valid
    end
  end

  describe 'validations' do
    it "is invalid without a dock count" do
      station = Station.record(name: "Station1", dock_count: 2, installation_date: "2014-09-04")
      expect(station).to_not be_valid
    end
  end

  describe 'validations' do
    it "is invalid without a city" do
      station = Station.record(name: "Station1", dock_count: 1, installation_date: "2015-10-02")
      expect(station).to_not be_valid
    end
  end

  describe 'validations' do
    it "is invalid without an installation_date" do
      station = Station.record(name: "Station1", dock_count: 5, city_name: "Auckland")
      expect(station).to_not be_valid
    end
  end

  describe 'validations' do
    it "is valid with all attributes" do
      station = Station.record(name: "Station1", dock_count: 3, city_name: "San Bernardino", installation_date: "2015-03-21")
      expect(station).to be_valid
    end
  end

  describe '.total_stations' do
    it "returns total stations" do
      Station.record(name: "Station1", dock_count: 10, city_name: "San Francisco", installation_date: "2013-03-10")
      Station.record(name: "Station2", dock_count: 5, city_name: "Auckland", installation_date: "2013-02-08")
      Station.record(name: "Station3", dock_count: 7, city_name: "Berkley", installation_date: "2011-05-14")
      expect(Station.total_stations).to eq(3)
    end
  end

  describe '.average_bikes_per_station' do
    it "returns average bikes per station" do
      Station.record(name: "Station1", dock_count: 15, city_name: "San Francisco", installation_date: "2013-03-10")
      Station.record(name: "Station1", dock_count: 5, city_name: "San Francisco", installation_date: "2013-03-10")
      expected = Station.average_bikes_per_station.to_i
      expect(expected).to eq(10)
    end
  end

  describe '.max_bikes' do
    it "returns maximum bikes per station" do
      Station.record(name: "Station1", dock_count: 15, city_name: "San Francisco", installation_date: "2013-03-10")
      Station.record(name: "Station1", dock_count:30, city_name: "San Francisco", installation_date: "2013-03-10")
      Station.record(name: "Station1", dock_count:10, city_name: "San Francisco", installation_date: "2013-03-10")
      expect(Station.max_bikes).to eq(30)
    end
  end

  describe '.station_with_most_bikes' do
    it "returns 10 stations with most bikes" do
      Station.record(name: "Station1", dock_count: 5, city_name: "San Francisco", installation_date: "2013-03-10")
      Station.record(name: "Station2", dock_count: 10, city_name: "Auckland", installation_date: "2013-05-02")
      Station.record(name: "Station3", dock_count: 10, city_name: "Berkeley", installation_date: "2013-06-12")
      Station.record(name: "Station4", dock_count: 7, city_name: "San Francisco", installation_date: "2013-03-10")
      result = Station.stations_with_most_bikes

      expect(result.first.name).to eq("Station2")
      expect(result.last.name).to eq("Station3")
    end
  end
end
