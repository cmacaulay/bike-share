class Condition < ActiveRecord::Base
  validates :date,
            :max_temperature,
            :min_temperature,
            :mean_temperature,
            :mean_humidity,
            :mean_visibility,
            :mean_wind_speed,
            :precipitation,
              presence: true

  has_many :trips, :foreign_key => :start_date

end





