class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "vitaminzone20k"
  end


  get '/' do
    "heyyyyy"
  end
end
