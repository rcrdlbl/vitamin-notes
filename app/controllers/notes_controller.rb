class NotesController < ApplicationController
  get '/vitamins/:id/notes/new' do
    @vitamin = VitaminBlend.find(params[:id])
    if !Helpers.logged_in?(session)
      redirect '/login'
    end
    erb :'notes/new'
  end

  post '/vitamins/:id/notes' do
    if !Helpers.logged_in?(session)
      redirect '/login'
    end

    @vitamin = VitaminBlend.find(params[:id])
    note = Note.create(content: params[:content], vitamin_blend_id: @vitamin.id, user_id: session[:user_id])
    redirect to "/vitamins/#{params[:id]}"
  end

  get '/notes/:id/edit' do
    @note = Note.find_by(id: params[:id])
    if !Helpers.logged_in?(session)
      redirect '/login'
    end
    erb :'notes/edit'
  end

  patch '/notes/:id' do
    @note = Note.find_by(id: params[:id])
    if params[:content] != "" && session[:user_id] == @note.user.id
      @note.content = params[:content]
      @note.save
      redirect to "/vitamins/#{@note.vitamin_blend.id}"
    else
      redirect to "/vitamins/#{@note.vitamin_blend.id}"
    end
  end

  delete '/notes/:id/delete' do
    @note = Note.find(params[:id])
    if session[:user_id] == @note.user.id
      @note.delete
      redirect to '/vitamins'
    else
      redirect to "/vitamins/#{@note.vitamin_blend.id}"
    end
  end
end
