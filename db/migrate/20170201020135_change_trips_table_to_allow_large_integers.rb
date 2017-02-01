class ChangeTripsTableToAllowLargeIntegers < ActiveRecord::Migration[5.0]
  def change
      change_column :trips, :duration, :integer, limit: 8
      change_column :trips, :zipcode, :integer, limit: 8
  end
end
