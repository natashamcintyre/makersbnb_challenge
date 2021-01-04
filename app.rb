require 'sinatra'

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
    session[:SpaceName] = params[:SpaceName]
    
    redirect '/spaces'
  end  

  get '/spaces' do 
    @home = session[:SpaceName]

    erb :spaces
  end 
end
