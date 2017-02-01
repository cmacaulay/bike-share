require_relative '../../spec_helper'

RSpec.describe "user can create new weather condition" do
  it "user can create a new weather condition" do

    visit('/conditions/new')

    fill_in 'condition[date]', with: "2014-06-17"
    fill_in 'condition[max_temperature]', with: 77
    fill_in 'condition[mean_temperature]', with: 55
    fill_in 'condition[min_temperature]', with: 44
    fill_in 'condition[mean_humidity]', with: 100
    fill_in 'condition[mean_visibility]', with: 3
    fill_in 'condition[mean_wind_speed]', with: 10
    fill_in 'condition[precipitation]', with: 0.09
    fill_in 'condition[zipcode]', with: 12345

    click_on 'Create New Weather Condition'
    binding.pry
    condition_test = Condition.find_by(date: "2014-06-17")

    expect(condition_test.max_temperature).to eq(77)
  end
end