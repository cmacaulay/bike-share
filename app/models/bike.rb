class Bike < ActiveRecord::Base
  validates :given_id,
    presence: true
  has_many :trips
end
