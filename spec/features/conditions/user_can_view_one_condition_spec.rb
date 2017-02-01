require_relative '../../spec_helper'
require 'pry'
RSpec.describe "when user visits a single station" do
  it "user sees an individual condition" do
    condition = Condition.create(date: "2013-05-16",
                                max_temperature: 74,
                                mean_temperature: 66,
                                min_temperature: 58,
                                mean_humidity: 67,
                                mean_visibility: 17,
                                mean_wind_speed: 4,
                                precipitation: 0.1,
                                zipcode: 91492)

                                save_and_open_page
      visit "/conditions/#{condition.id}"

      # binding.pry
      expect(page).to have_content(condition.date)
      expect(page).to have_content(condition.max_temperature)
      expect(page).to have_content(condition.min_temperature)
      expect(page).to have_content(condition.mean_temperature)
      expect(page).to have_content(condition.mean_humidity)
      expect(page).to have_content(condition.mean_visibility)
   end
  end
