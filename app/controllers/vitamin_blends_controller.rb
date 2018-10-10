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
    erb :'vitamin_blends/show'
  end

  get '/vitamins/:id/edit' do
    if !Helpers.logged_in?(session)
      redirect '/login'
    end

    @vitamin = VitaminBlend.find(params[:id])
    erb :'vitamin_blends/edit'
  end

  patch '/vitamins/:id' do
    @vitamin = VitaminBlend.find(params[:id])
    if params[:contents] != "" && session[:user_id] == @vitamin.user.id
      @vitamin.contents = params[:contents]
      @vitamin.save
      redirect to '/vitamins'
    else
      redirect to "/vitamins/#{params[:id]}"
    end
  end
end
