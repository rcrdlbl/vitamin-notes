class VitaminBlendsController < ApplicationController
  get '/vitamins' do
    Helpers.redirect_if_not_logged_in(session)
    @vitamins = VitaminBlend.all
    erb :'vitamin_blends/all'
  end

  get '/vitamins/new' do
    Helpers.redirect_if_not_logged_in(session)
    erb :'vitamin_blends/new'
  end

  post '/vitamins' do
    Helpers.redirect_if_not_logged_in(session)
    unless params[:contents] != ""
      redirect '/vitamin_blends/new'
    end

    vitamin = VitaminBlend.create(contents: params[:contents], user_id: session[:user_id])
    redirect '/vitamins'
  end

  get '/vitamins/:id' do
    if !Helpers.logged_in?(session)
      redirect '/login'
    end

    @vitamin = VitaminBlend.find(params[:id])
    erb :'users/show'
  end
end
