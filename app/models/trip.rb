class Trip < ActiveRecord::Base
  validates :duration,
            :start_date,
            :start_station_id,
            :end_date,
            :end_station_id,
            :bike_id,
            :subscription_id,
               presence: true

  belongs_to :bike
  belongs_to :subscription
  belongs_to :start_station, class_name: "Station", foreign_key: "start_station_id"
  belongs_to :end_station, class_name: "Station", foreign_key: "end_station_id"

  def self.shortest_ride
    minimum(:duration)
  end

  def self.longest_ride
    maximum(:duration)
  end

  def self.average_ride_duration
    average(:duration)
  end

  def self.most_ridden_bike
    #with total numbers of rides for that bike most
    group(:bike_id).count("id").max_by do |bike, count|
      count
    end
    #returns array of [bike_ids, number of rides]
  end

  def self.least_ridden_bike
    group(:bike_id).count("id").min_by do |bike, count|
      count
    end
  end

  def self.date_least_travelled
    group(:start_date).count("id").min_by do |date, count|
      count
    end
  end

  def self.date_most_travelled
    group(:start_date).count("id").max_by do |date, count|
      count
    end
  end

  def self.most_popular_starting_station
    group(:start_station_id).count("id").max_by do |station, count|
      count
    end
  end

    def self.most_popular_ending_station
    group(:end_station_id).count("id").max_by do |station, count|
      count
    end
  end

end
