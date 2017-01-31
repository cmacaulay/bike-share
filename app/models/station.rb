require 'pry'
class Station < ActiveRecord::Base
  belongs_to :city
  has_many   :trips

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
    where("dock_count = #{max_bikes}")
  end

  def self.newest_station
    # station most recently installed
    order(:installation_date).last
  end

  def self.oldest_station
    order(:installation_date).first
  end

  def self.fewest_bikes
    minimum(:dock_count)
  end

  def self.find_by_fewest_bikes
    #returns instances of station that have the lowest dock_count
    return [] if fewest_bikes.nil?
    where("dock_count = #{fewest_bikes}")
  end

  def rides_started_at_station(trip)
    Trip.where(start_station_id: trip.start_station_id).count

  end

    def rides_ended_at_station(trip)
    Trip.where(end_station_id: trip.end_station_id).count

  def most_frequent_starting_bike_id
    Station.group(:bike_id).count("id").max_by do |bike, count|
      count
    end
    #returns array of [bike_ids, number of rides]
  end

  def self.most_frequent_destination
    maximum(:end_station_id)
  end

  def self.date_with_most_trips_starting
    maximum(:start_date)
  end

  def self.most_frequent_zipcode_starting
    group(:zipcode).count
  end

end
