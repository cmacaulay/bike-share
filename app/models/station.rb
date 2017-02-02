class Station < ActiveRecord::Base
  belongs_to :city
  has_many   :trips
  has_many   :start_trips, class_name: "Trip", foreign_key: "start_station_id"
  has_many   :end_trips, class_name: "Trip", foreign_key: "end_station_id"

  validates :name,
            :dock_count,
            :city_id,
            :installation_date,
              presence: true

  def find_city_id(city_name)
    City.record(name: city_name).id
  end

  def self.find_city_id(city_name)
    City.record(name: city_name).id
  end

  def self.total_stations
    count(:all)
  end

  def self.average_bikes_per_station
    average(:dock_count).to_f.round(2)
  end

  def self.max_bikes
    #most bikes available at a station
    maximum(:dock_count)
  end

  def self.stations_with_most_bikes
    #stations where most bikes are available
    return [] if max_bikes.nil?
    where(dock_count: max_bikes)
  end

  def self.fewest_bikes
    minimum(:dock_count)
  end

  def self.newest_station
    # station most recently installed
    order(:installation_date).last.name
  end

  def self.oldest_station
    order(:installation_date).first.name
  end

  def self.find_by_fewest_bikes
    #returns instances of station that have the lowest dock_count
    return [] if fewest_bikes.nil?
    where("dock_count = #{fewest_bikes}")
  end

  def most_frequent_bike_id(trip, bike)
    Trip.where(bike_id: trip.bike_id).count
  end

  def rides_started_at_station(station)
    station.start_trips.count
  end

  def rides_ended_at_station(station)
    station.end_trips.count
  end

  def most_frequent_destination
    start_trips.group(:end_station_id).order("count_id DESC").limit(1).count(:id).keys.first
  end

  def most_frequent_origination_station
    end_trips.group(:start_station_id).order("count_id DESC").limit(1).count(:id).keys.first
  end

  def self.date_with_most_trips
    result = Trip.group(:start_date).count("id").max_by do |start_date, count|
      count
    end
    result.first
  end

  def self.most_frequent_zipcode
    result = Trip.group(:zipcode).count("id").max_by do |zipcode, count|
      count
    end
    result.first
  end

  def self.most_frequent_starting_bike_id
    trips = Trip.all
    result = trips.group(:bike_id).count("id").max_by do |bike, count|
      count
    end
    result.first
  end
end
