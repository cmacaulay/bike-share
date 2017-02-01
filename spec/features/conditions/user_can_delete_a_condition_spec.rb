require_relative '../../spec_helper'

RSpec.describe "when user visits a condition path" do
  it "user can delete a condition" do
      condition = Condition.create(date: "2013-05-16",
                              max_temperature: 74,
                              mean_temperature: 66,
                              min_temperature: 58,
                              mean_humidity: 67,
                              mean_visibility: 17,
                              mean_wind_speed: 4,
                              precipitation: 0.1,
                              zipcode: 91492)
  
    visit("/stations/#{station.id}")

    expect {click_on 'Delete Weather Condition'}.to change(Condition.all, :count).by(-1)
    expect(page).to_not have_content(condition.date)
    expect(current_path).to eq("/conditions")
  end
end