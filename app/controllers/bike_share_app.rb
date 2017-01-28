class BikeShareApp < Sinatra::Base

  get '/' do

    erb: index
  end

  get '/stations' do
    @stations = Station.all

    erb :'stations/index'
  end

  get '/stations/new' do
    @stations = Station.new

    erb :'stations/new'
  end

  get '/stations/:id' do
    @stations = Station.find(params[:id])

    erb :'stations/show'
  end

  get '/stations/:id/edit' do
    @stations = Station.find(params[:id])

    erb :'stations/edit''
  end

  post '/stations' do
    @stations = Station.create(params[:station])
    redirect '/stations/'
  end

  get '/stations/:id/edit' do
    @stations = Station.find(params[:id])

    erb :'stations/edit'
  end

   put '/stations/:id' do
    Station.update(params[:id, params[:station])
    redirect '/stations'
  end

  delete '/stations/:id' do
    Station.destroy(params[:id])
    redirect '/stations'
  end

end
