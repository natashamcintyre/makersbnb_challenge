require 'sinatra'
require_relative 'database_connection'
require_relative './lib/space.rb'

class MakersBnb < Sinatra::Base
  set :session_secret, 'super secret'

  enable :sessions

  get '/' do
    erb :index
  end

  get '/spaces/new' do
    erb :spaces_new
  end

  post '/space/save' do
    Space.create(params[:space])
    redirect '/spaces'
  end

  get '/spaces' do
    erb :spaces
  end
  
  get '/space/:id/reserve' do 
    p params
    Space.find(:id).update(available: FALSE)
    "You have reversed Cottage for one night.:)"
  end

end
