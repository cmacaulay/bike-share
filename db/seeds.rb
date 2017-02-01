require_relative 'seed_helper'

  def import_stations_from_csv
    Station.delete_all
    file_name = 'db/csv/station.csv'
    CSV.foreach(file_name, headers: true, header_converters: :symbol) do |row|

                name              = row[:name]
                dock_count        = row[:dock_count]
                city_name         = row[:city]
                installation_date = transform_date(row[:installation_date])

                city = City.find_or_create_by(name: city_name)
                Station.create(name: name,
                dock_count: dock_count,
                city: city,
                installation_date: installation_date
                )
    end
    puts "Imported Stations to Station Table!"
  end

  def transform_date(date)
    Time.strptime(date, "%m/%d/%Y").strftime("%d/%m/%Y")
  end

  def import_trips_from_csv
    Trip.delete_all
    CSV.foreach('db/csv/trip.csv', headers: true, header_converters: :symbol) do |row|
      Trip.create(duration:         row[:duration].to_i,
                  start_date:       transform_date(row[:start_date]),
                  start_station:    Station.find_or_create_by(name: row[:start_station_name]),
                  end_date:         transform_date(row[:end_date]),
                  end_station:      Station.find_or_create_by(name: row[:end_station_name]),
                  bike:             Bike.find_or_create_by(given_id: row[:bike_id]),
                  subscription:     Subscription.find_or_create_by(name: row[:subscription_type]),
                  zipcode:          row[:zip_code].to_i,
                  condition:        Condition.find_by( date: transform_date(row[:start_date]) )

                  )
    end
    puts "Imported Trips to Trips Table!"
  end

  def import_conditions_from_csv
    Condition.delete_all
    CSV.foreach('db/csv/weather.csv', headers: true, header_converters: :symbol) do |row|
      Condition.create(date:            transform_date(row[:date]),
                      max_temperature:  row[:max_temperature_f].to_i,
                      min_temperature:  row[:min_temperature_f].to_i,
                      mean_temperature: row[:mean_temperature_f].to_i,
                      mean_humidity:    row[:mean_humidity].to_i,
                      mean_visibility:  row[:mean_visibility_miles].to_i,
                      mean_wind_speed:  row[:mean_wind_speed_mph].to_i,
                      precipitation:    row[:precipitation_inches].to_f,
                      zipcode:          row[:zip_code]
                      )
    end
    puts "Imported Conditions to Conditions Table!"
  end

  import_stations_from_csv
  import_conditions_from_csv
  import_trips_from_csv
