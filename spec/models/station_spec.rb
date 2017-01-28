require_relative '../spec_helper'

RSpec.describe Station do
  describe 'validations' do
    it "is invalid without all attributes" do
      station_1 = Station.create(name: "Station1", dock_count: 20, city: "San Francisco")
      station_2 = Station.create(name: "Station2", dock_count: 30, installation_date: "2016-02-06")

      expect(station_1).to_not be_valid
      expect(station_2).to_not be_valid
    end
  end

  describe 'validations' do
    it "is invalid without a name" do
      station = Station.create(dock_count: 5, city: "Denver", installation_date: "2016-02-05")

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
      station = Station.create(name: "Station1", dock_count: 5, city: "Auckland")

      expect(station).to_not be_valid
    end
  end

  describe 'validations' do
    it "is valid with all attributes" do
      station = Station.create(name: "Station1", dock_count: 3, city: "San Bernardino", installation_date: "2015-03-21")

      expect(station).to be_valid
    end
  end
end
