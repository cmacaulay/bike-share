require 'csv'
require 'active_record'
require_relative '../app/models/station'
require_relative '../app/models/city'


  def populate_stations
    file_name = 'db/csv/station.csv'
    CSV.foreach(file_name, headers: true, header_converters: :symbol) do |row|

      name = row[:name]
      dock_count = row[:dock_count]
      city_name = row[:city]
      installation_date = transform_date(row)

      city = City.find_or_create_by(name: city_name)
      Station.create(name: name,
        dock_count: dock_count,
        city: city,
        installation_date: installation_date)
    end
  end

  def transform_date(row)
    date = row[:installation_date]
    Time.strptime(date, "%m/%d/%Y").strftime("%d/%m/%Y")
  end

  populate_stations