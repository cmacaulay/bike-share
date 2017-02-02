require 'pry'
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
  belongs_to :condition, foreign_key: "date"

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
    Station.find(Trip.group(:start_station_id).order('count_id DESC').limit(1).count(:id).keys.first)
  end

  def self.most_popular_ending_station
    Station.find(Trip.group(:end_station_id).order('count_id ASC').limit(1).count(:id).keys.first)
  end


  def self.conditions_on_fewest_trips_date
    date = Trip.date_least_travelled.first
    date_condition = Condition.find_by(date: date)
# binding.pry

    "Precipitation in Inches: #{date_condition.precipitation}"
  end
  
  # def self.number_of_subscribers
  #   where.(subscription_id: 1).count
  # end
  #
  # def self.number_of_customers
  #   where.(subscription_id: 2).count
  # end
  #
  # def self.percentage_of_customers
  #   ((number_of_customers.to_f/self.count.to_f) * 100).round(0)
  # end
  #
  # def self.percentage_of_subscribers
  #   ((number_of_subscribers.to_f/self.count.to_f) * 100).round(0)
  # end



end


