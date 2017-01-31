require_relative '../spec_helper'
RSpec.describe Trip do
  describe 'validations' do
    it "is invalid without a duration" do
      trip = Trip.create(start_date:       "2013/01/01 12:00",
                         start_station_id: 6,
                         end_date:         "2005/06/23 16:31",
                         end_station_id:   2,
                         bike_id:          25,
                         subscription_id:  1,
                         zipcode:         80789
                        )
      expect(trip).to_not be_valid
    end
  end
  describe 'validations' do
    it "is invalid without a start date" do
      trip = Trip.create(duration:         67,
                         start_station_id: 1,
                         end_date:         "2013/06/03 18:56",
                         end_station_id:   2,
                         bike_id:          25,
                         subscription_id:  1,
                         zipcode:         80789
                        )
      expect(trip).to_not be_valid
    end
  end
  describe 'validations' do
    it "is invalid without a start station id" do
      trip = Trip.create(duration:         67,
                         start_date:       "2013/01/01 12:00",
                         end_date:         "2005/06/23 16:31",
                         bike_id:          25,
                         subscription_id:  1,
                         zipcode:         80789
                        )
      expect(trip).to_not be_valid
    end
  end
  describe 'validations' do
    it "is invalid without an end station id" do
      trip = Trip.create(duration:         67,
                         start_date:       "2013/01/01 12:00",
                         start_station_id: 6,
                         end_date:         "2005/06/23 16:31",
                         bike_id:          25,
                         subscription_id:  1,
                         zipcode:         80789
                        )
      expect(trip).to_not be_valid
    end
  end
  describe 'validations' do
    it "is invalid without an end date" do
      trip = Trip.create(duration:         67,
                         start_date:       "2013/01/01 12:00",
                         start_station_id: 6,
                         end_station_id:   2,
                         bike_id:          25,
                         subscription_id:  1,
                         zipcode:         80789
                        )
      expect(trip).to_not be_valid
    end
  end
  describe 'validations' do
    it "is invalid without a bike id" do
      trip = Trip.create(duration:         67,
                         start_date:       "2013/01/01 12:00",
                         start_station_id: 6,
                         end_date:         "2005/06/23 16:31",                         end_station_id:   2,
                         subscription_id:  1,
                         zipcode:         80789
                        )
      expect(trip).to_not be_valid
    end
  end
  describe 'validations' do
    it "is invalid without a subscription id" do
      trip = Trip.create(duration:         67,
                         start_date:       "2013/01/01 12:00",
                         start_station_id: 6,
                         end_date:         "2005/06/23 16:31",
                         end_station_id:   2,
                         bike_id:  1,
                         zipcode:         80789
                        )
      expect(trip).to_not be_valid
    end
  end
  describe 'validations' do
    it "is valid without a zip code" do
      trip = Trip.create(duration:         67,
                         start_date:       "2013/01/01 12:00",
                         start_station_id: 6,
                         end_date:         "2005/06/23 16:31",
                         end_station_id:   2,
                         bike_id:          12,
                         subscription_id:  1,
                        )
      expect(trip).to be_valid
    end
  end
  describe 'will create with all attributes' do
    it 'is valid with all attributes' do
      trip = Trip.create(duration:         67,
                         start_date:       "2013/01/01 12:00",
                         start_station_id: 6,
                         end_date:         "2005/06/23 16:31",
                         end_station_id:   2,
                         bike_id:          12,
                         subscription_id:  1,
                         zipcode:           87877
                        )
    end
  end
end
