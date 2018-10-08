class UsersController < ApplicationController

  get '/signup' do
    if !session[:user_id]
      erb :'users/new'
    else
      redirect to '/vitamins'
    end
  end

  post '/signup' do
    if params[:username] != "" && params[:password] != ""
      user = User.create(username: params[:username], password: params[:password])
      session[:user_id] = user.id
      redirect to '/vitamins'
    else
      redirect to '/signup'
    end
  end

  get '/login' do
    if Helpers.logged_in?(session)
      redirect to '/vitamins'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/vitamins'
    else
      redirect to '/login'
    end
  end

end
