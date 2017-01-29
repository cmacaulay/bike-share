class Station < ActiveRecord::Base
  validates :name,
            :dock_count,
            :city,
            :installation_date,
            presence: true

  def self.total_stations
    count(:all)
    #all.count (plan b)
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
end
