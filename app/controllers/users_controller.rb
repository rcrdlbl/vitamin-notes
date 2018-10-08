class UsersController < ApplicationController

  get '/signup' do
    if !session[:user_id]
      erb :'users/new'
    else
      redirect to '/' #change this later
    end
  end

  post '/signup' do
    if params[:username] != "" && params[:password] != ""
      user = User.create(username: params[:username], password: params[:password])
      session[:user_id] = user.id
      redirect '/vitamins'
    else
      redirect '/signup'
    end
  end

end
