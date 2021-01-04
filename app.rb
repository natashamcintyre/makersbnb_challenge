require 'sinatra'

class MakersBnb < Sinatra::Base

  get '/' do 
    erb :index
  end

  get '/spaces/new' do
    erb :spaces
  end

  # get '/spaces/new' do
  #   "Hello World"
  # end

end
