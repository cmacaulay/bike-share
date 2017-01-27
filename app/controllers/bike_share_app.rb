class BikeShareApp < Sinatra::Base

  get '/stations' do
    @stations = Station.all
    erb :'stations/index'
  end

  get '/stations/new' do
    @station = Station.new
    erb :'stations/new'
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :'stations/show'
  end

  post '/stations' do
    @station = Station.create(params[:station])
    redirect "/stations/#{@station.id}"
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])

    erb :'stations/edit'
  end

  delete '/stations/:id' do |id|
    Station.destroy(id.to_i)
    redirect '/stations'
  end



end
