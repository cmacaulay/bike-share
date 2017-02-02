require_relative '../spec_helper'

RSpec.describe Condition do
  # describe 'validations' do
  #   it "is invalid without a date " do
  #     condition = Condition.create(max_temperature: 74,
  #                                 mean_temperature: 66,
  #                                 min_temperature: 58,
  #                                 mean_humidity: 67,
  #                                 mean_visibility: 17,
  #                                 mean_wind_speed: 4,
  #                                 precipitation: 0.1,
  #                                 zipcode: 91492)
  #     expect(condition).to_not be_valid
  #   end
  # end

  # describe 'validations' do
  #   it "is invalid without maximum temperature " do
  #     condition = Condition.create(date: "2013-05-16",
  #                                 mean_temperature: 66,
  #                                 min_temperature: 58,
  #                                 mean_humidity: 67,
  #                                 mean_visibility: 17,
  #                                 mean_wind_speed: 4,
  #                                 precipitation: 0.1,
  #                                 zipcode: 91492)
  #     expect(condition_1).to_not be_valid
  #   end
  # end
  #
  # describe 'validations' do
  #   it "is invalid without mean temperature " do
  #     condition = Condition.create(date: "2013-05-16",
  #                                 max_temperature: 74,
  #                                 min_temperature: 58,
  #                                 mean_humidity: 67,
  #                                 mean_visibility: 17,
  #                                 mean_wind_speed: 4,
  #                                 precipitation: 0.1,
  #                                 zipcode: 91492)
  #     expect(condition_1).to_not be_valid
  #   end
  # end
  #
  # describe 'validations' do
  #   it "is invalid without min temperature " do
  #     condition = Condition.create(date: "2013-05-16",
  #                                 max_temperature: 74,
  #                                 mean_temperature: 66,
  #                                 mean_humidity: 67,
  #                                 mean_visibility: 17,
  #                                 mean_wind_speed: 4,
  #                                 precipitation: 0.1,
  #                                 zipcode: 91492)
  #     expect(condition_1).to_not be_valid
  #   end
  # end
  #
  # describe 'validations' do
  #   it "is invalid without mean humidity " do
  #     condition = Condition.create(date: "2013-05-16",
  #                                 max_temperature: 74,
  #                                 mean_temperature: 66,
  #                                 min_temperature: 58,
  #                                 mean_visibility: 17,
  #                                 mean_wind_speed: 4,
  #                                 precipitation: 0.1,
  #                                 zipcode: 91492)
  #     expect(condition_1).to_not be_valid
  #   end
  # end
  #
  # describe 'validations' do
  #   it "is invalid without mean visibility " do
  #     condition = Condition.create(date: "2013-05-16",
  #                                 max_temperature: 74,
  #                                 mean_temperature: 66,
  #                                 min_temperature: 58,
  #                                 mean_humidity: 67,
  #                                 mean_wind_speed: 4,
  #                                 precipitation: 0.1,
  #                                 zipcode: 91492)
  #     expect(condition_1).to_not be_valid
  #   end
  # end
  #
  # describe 'validations' do
  #   it "is invalid without mean wind speed " do
  #     condition = Condition.create(date: "2013-05-16",
  #                                 max_temperature: 74,
  #                                 mean_temperature: 66,
  #                                 min_temperature: 58,
  #                                 mean_humidity: 67,
  #                                 mean_visibility: 17,
  #                                 precipitation: 0.1,
  #                                 zipcode: 91492)
  #     expect(condition_1).to_not be_valid
  #   end
  # end
  #
  # describe 'validations' do
  #   it "is invalid without precipitation " do
  #     condition = Condition.create(date: "2013-05-16",
  #                                 max_temperature: 74,
  #                                 mean_temperature: 66,
  #                                 min_temperature: 58,
  #                                 mean_humidity: 67,
  #                                 mean_visibility: 17,
  #                                 mean_wind_speed: 4,
  #                                 zipcode: 91492)
  #     expect(condition_1).to_not be_valid
  #   end
  # end
  #
  # describe 'validations' do
  #   it "is invalid without zipcode " do
  #     condition = Condition.create(date: "2013-05-16",
  #                                 max_temperature: 74,
  #                                 mean_temperature: 66,
  #                                 min_temperature: 58,
  #                                 mean_humidity: 67,
  #                                 mean_visibility: 17,
  #                                 mean_wind_speed: 4,
  #                                 precipitation: 0.1)
  #     expect(condition_1).to_not be_valid
  #   end
  # end
  #
  # describe 'validations' do
  #   it "is valid with all the attributes " do
  #     condition = Condition.create(date: "2013-05-16",
  #                                 max_temperature: 74,
  #                                 mean_temperature: 66,
  #                                 min_temperature: 58,
  #                                 mean_humidity: 67,
  #                                 mean_visibility: 17,
  #                                 mean_wind_speed: 4,
  #                                 precipitation: 0.1,
  #                                 zipcode: 91492)
  #     expect(condition_1).to be_valid
  #   end
  # end
end
