require 'csv'
require 'active_record'
require_relative '../app/models/station'

  def open_file
    file_name = '../csv/station.csv'
    CSV.open(file_name,
                      headers: true,
                      header_converters: :symbol)
    require 'pry';binding.pry
      csv.each do |row|
        Station.new(:name, :dock_count, :city, :installation_date)
    end
    open_file
  end