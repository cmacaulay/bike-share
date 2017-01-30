class Bike < ActiveRecord::Base
  validates :name, presence: true
  has_many :trips
end
