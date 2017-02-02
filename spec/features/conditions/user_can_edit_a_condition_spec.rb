require_relative '../../spec_helper'

RSpec.describe "when user visits edit weather condition path" do
  it "user can edit a condition" do
    condition = Condition.create(date: "2013-05-16",
                                max_temperature: 74,
                                mean_temperature: 66,
                                min_temperature: 58,
                                mean_humidity: 67,
                                mean_visibility: 17,
                                mean_wind_speed: 4,
                                precipitation: 0.1,
                                zipcode: 91492)

    visit("/conditions/#{condition.id}/edit")

    fill_in 'condition[date]', with: "2014-06-17"
    fill_in 'condition[max_temperature]', with: 77
    fill_in 'condition[mean_temperature]', with: 55
    fill_in 'condition[min_temperature]', with: 44
    fill_in 'condition[mean_humidity]', with: 100
    fill_in 'condition[mean_visibility]', with: 3
    fill_in 'condition[mean_wind_speed]', with: 10
    fill_in 'condition[precipitation]', with: 0.09
    fill_in 'condition[zipcode]', with: 12345

    click_on "Submit Changes"

    condition = Condition.last

    expect(condition.max_temperature).to eq(77)
  end
end
