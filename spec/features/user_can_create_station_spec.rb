require_relative '../spec_helper'

RSpec.describe "when user visits new station path" do
  it "user can create new station"

  Station.create(name: "Station1", dock_count: 2, city: "Auckland", installation_date: "2015-09-06")

  #user visits new station site (/stations/new) view new.erb
  #user fills in form
  #user clicks submit button
  #user sees new station created (/stations/#{id}) view show.erb

  visit('/stations/new')

  expect
end
