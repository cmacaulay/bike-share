require 'will_paginate'
require 'will_paginate/active_record' 

class BikeShareApp < Sinatra::Base
  include WillPaginate::Sinatra::Helpers

  get '/' do
    erb :index
  end

  get '/stations' do
    @stations = Station.all

    erb :'stations/index'
  end

  get '/stations/new' do
    @station = Station.new
    @cities = City.all

    erb :'stations/new'
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])

    erb :'stations/show'
  end

  get '/stations/:id/edit' do
    @cities  = City.all
    @station = Station.find(params[:id])

    erb :'stations/edit'
  end

  post '/stations' do
    @station = Station.create(params[:station])
    redirect "/stations/#{@station.id}"
  end

   put '/stations/:id' do
    @station = Station.update(params[:id], params[:station])
    redirect "/stations/#{@station.id}"
  end

  delete '/stations/:id' do
    Station.destroy(params[:id])
    redirect '/stations'
  end

  get '/station-dashboard' do
    @stations = Station.all
    erb :'stations/station-dashboard'
  end

  get '/trips' do
    @trips = Trip.paginate(:page => params[:page], :per_page => 30)
    erb :'trips/index'
  end

  get '/trips/new' do
    @trip = Trip.new

    erb :'/trips/new'
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])

    erb :'/trips/show'
  end

  get '/trips/:id/edit' do
    @stations = Station.all
    @trip = Trip.find(params[:id])

    erb :'/trips/edit'
  end

  post '/trips' do
    @trip = Trip.create(params[:trip])
    redirect "/trips/#{@trip.id}"
  end

  put '/trips/:id' do
    @trip = Trip.update(params[:id], params[:trip]) #params[:id].to_i ????
    redirect "/trips/#{@trip.id}"
  end

  delete '/trips/:id' do
    Trip.destroy(paramas[:id])
    redirect '/trips'
  end

  get '/trips-dashboard' do
    @trips = Trip.all
    erb :'trips/trips-dashboard'
  end
end
