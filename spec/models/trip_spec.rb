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
    it "is invalid without a end station id" do
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
    it "is invalid without a end date" do
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
      expect(trip).to be_valid
    end
  end

  describe '.shortest_ride' do
    it 'returns nil when no trips are in database' do
      expect(Trip.shortest_ride).to eq(nil)
    end
    it 'will calculate the shortest duration of a ride' do
      trip1 = Trip.create(duration:       60,
                         start_date:      "2013/01/01 12:00",
                         start_station_id: 6,
                         end_date:        "2005/06/23 16:31",
                         end_station_id:   2,
                         bike_id:          12,
                         subscription_id:  1,
                        )
      trip2 = Trip.create(duration:         20,
                          start_date:       "2005/01/01 12:00",
                          start_station_id: 4,
                          end_date:         "2013/08/06 12:00",
                          end_station_id:   3,
                          bike_id:          7,
                          subscription_id:  2,
                        )

      expect(Trip.shortest_ride).to eq(20)
    end
  end

  describe '.longest_ride' do
    it 'returns nil when no trips are in database' do
      expect(Trip.longest_ride).to eq(nil)
    end
    it 'will calculate the longest duration of a ride' do
      trip1 = Trip.create(duration:       60,
                         start_date:      "2013/01/01 12:00",
                         start_station_id: 6,
                         end_date:        "2005/06/23 16:31",
                         end_station_id:   2,
                         bike_id:          12,
                         subscription_id:  1,
                        )
      trip2 = Trip.create(duration:         20,
                          start_date:       "2005/01/01 12:00",
                          start_station_id: 4,
                          end_date:         "2013/08/06 12:00",
                          end_station_id:   3,
                          bike_id:          7,
                          subscription_id:  2,
                        )

      expect(Trip.longest_ride).to eq(60)
    end
  end

  describe '.average_ride_duration' do
    it 'returns nil when no trips are in database' do
      expect(Trip.average_ride_duration).to eq(nil)
    end
    it 'will calculate the average ride duration' do
      trip1 = Trip.create(duration:       20,
                         start_date:      "2013/01/01 12:00",
                         start_station_id: 6,
                         end_date:        "2005/06/23 16:31",
                         end_station_id:   2,
                         bike_id:          12,
                         subscription_id:  1,
                        )
      trip2 = Trip.create(duration:         10,
                          start_date:       "2005/01/01 12:00",
                          start_station_id: 4,
                          end_date:         "2013/08/06 12:00",
                          end_station_id:   3,
                          bike_id:          7,
                          subscription_id:  2,
                        )

      expect(Trip.average_ride_duration).to eq(15)
    end
  end

  describe '.most_ridden_bike' do
    it 'returns nil with no trips are in database' do
      expect(Trip.most_ridden_bike).to eq(nil)
    end
    it 'identifies bike with most rides and calculates total rides' do
      trip1 = Trip.create(duration:       20,
                         start_date:      "2013/01/01 12:00",
                         start_station_id: 6,
                         end_date:        "2005/06/23 16:31",
                         end_station_id:   2,
                         bike_id:          12,
                         subscription_id:  1,
                        )
      trip2 = Trip.create(duration:         10,
                          start_date:       "2005/01/01 12:00",
                          start_station_id: 4,
                          end_date:         "2013/08/06 12:00",
                          end_station_id:   3,
                          bike_id:          12,
                          subscription_id:  2,
                        )
      trip2 = Trip.create(duration:         10,
                          start_date:       "2005/01/01 12:00",
                          start_station_id: 4,
                          end_date:         "2013/08/06 12:00",
                          end_station_id:   3,
                          bike_id:          2,
                          subscription_id:  2,
                         )

      expect(Trip.most_ridden_bike).to eq([12, 2])
    end
  end

  describe '.least_ridden_bike' do
    it 'returns nil with no trips are in database' do
      expect(Trip.least_ridden_bike).to eq(nil)
    end
    it 'identifies bike with least rides and calculates total rides' do
      trip1 = Trip.create(duration:       20,
                         start_date:      "2013/01/01 12:00",
                         start_station_id: 6,
                         end_date:        "2005/06/23 16:31",
                         end_station_id:   2,
                         bike_id:          12,
                         subscription_id:  1,
                        )
      trip2 = Trip.create(duration:         10,
                          start_date:       "2005/01/01 12:00",
                          start_station_id: 4,
                          end_date:         "2013/08/06 12:00",
                          end_station_id:   3,
                          bike_id:          12,
                          subscription_id:  2,
                        )
      trip2 = Trip.create(duration:         10,
                          start_date:       "2005/01/01 12:00",
                          start_station_id: 4,
                          end_date:         "2013/08/06 12:00",
                          end_station_id:   3,
                          bike_id:          2,
                          subscription_id:  2,
                         )

      expect(Trip.least_ridden_bike).to eq([2, 1])
    end
  end

  describe '.date_least_travelled' do
    it 'returns nil with no trips are in database' do
      expect(Trip.date_least_travelled).to eq(nil)
    end
    it 'identifies date with least rides and calculates total rides' do
      trip1 = Trip.create(duration:       20,
                         start_date:      "2013/01/01 12:00",
                         start_station_id: 6,
                         end_date:        "2013/01/01 16:31",
                         end_station_id:   2,
                         bike_id:          12,
                         subscription_id:  1,
                        )
      trip2 = Trip.create(duration:         10,
                          start_date:       "2005/01/01 12:00",
                          start_station_id: 4,
                          end_date:         "2005/01/01 14:00",
                          end_station_id:   3,
                          bike_id:          12,
                          subscription_id:  2,
                        )
      trip2 = Trip.create(duration:         10,
                          start_date:       "2005/01/01 12:00",
                          start_station_id: 4,
                          end_date:         "2005/01/01 14:00",
                          end_station_id:   3,
                          bike_id:          2,
                          subscription_id:  2,
                         )

      expect(Trip.date_least_travelled).to eq(["2013/01/01 12:00", 1])
    end
  end

  describe '.date_most_travelled' do
    it 'returns nil with no trips are in database' do
      expect(Trip.date_most_travelled).to eq(nil)
    end
    it 'identifies date with most rides and calculates total rides' do
      trip1 = Trip.create(duration:       20,
                         start_date:      "2013/01/01 12:00",
                         start_station_id: 6,
                         end_date:        "2013/01/01 16:31",
                         end_station_id:   2,
                         bike_id:          12,
                         subscription_id:  1,
                        )
      trip2 = Trip.create(duration:         10,
                          start_date:       "2005/01/01 12:00",
                          start_station_id: 4,
                          end_date:         "2005/01/01 14:00",
                          end_station_id:   3,
                          bike_id:          12,
                          subscription_id:  2,
                        )
      trip2 = Trip.create(duration:         10,
                          start_date:       "2005/01/01 12:00",
                          start_station_id: 4,
                          end_date:         "2005/01/01 14:00",
                          end_station_id:   3,
                          bike_id:          2,
                          subscription_id:  2,
                         )

      expect(Trip.date_most_travelled).to eq(["2005/01/01 12:00", 2])
    end
  end

  describe '.most_popular_starting_station' do
    it 'returns nil when no trips are in database' do
      expect(Trip.most_popular_starting_station).to eq(nil)
    end
    it 'will calculate the most frequently used starting station' do
      trip1 = Trip.create(duration:       20,
                         start_date:      "2013/01/01 12:00",
                         start_station_id: 6,
                         end_date:        "2005/06/23 16:31",
                         end_station_id:   2,
                         bike_id:          12,
                         subscription_id:  1,
                        )
      trip2 = Trip.create(duration:         10,
                          start_date:       "2005/01/01 12:00",
                          start_station_id: 4,
                          end_date:         "2013/08/06 12:00",
                          end_station_id:   3,
                          bike_id:          7,
                          subscription_id:  2,
                        )
      trip3 = Trip.create(duration:       30,
                         start_date:      "2013/01/02 12:00",
                         start_station_id: 6,
                         end_date:        "2005/06/23 16:31",
                         end_station_id:   3,
                         bike_id:          11,
                         subscription_id:  1,
                        )

      expect(Trip.most_popular_starting_station).to eq([6, 2])
    end
  end
end
