class UsersController < ApplicationController

  get '/signup' do
    if !session[:user_id]
      erb :'users/new'
    else
      redirect to '/vitamins'
    end
  end

  post '/signup' do
    if params[:username] != "" && params[:password] != "" && !User.find_by(username: params[:username])
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

  get '/users/:id' do
    if !Helpers.logged_in?(session)
      redirect '/login'
    end

    @user = User.find(params[:id])
    if !@user.nil? && @user == Helpers.current_user(session)
      erb :'users/show'
    else
      redirect '/vitamins'
    end
  end

  get '/logout' do
    if !Helpers.logged_in?(session)
      redirect '/login'
    else
      session.clear
      redirect '/'
    end
  end

end
