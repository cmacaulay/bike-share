class City < ActiveRecord::Base
  validates :name, presence: true
  has_many :stations

  def self.record(city_information)
    self.find_or_create_by(city_information)
  end

end
