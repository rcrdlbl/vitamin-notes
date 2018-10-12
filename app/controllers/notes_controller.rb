class NotesController < ApplicationController
  get '/vitamins/:id/notes/new' do
    @vitamin = VitaminBlend.find(params[:id])
    if !Helpers.logged_in?(session)
      redirect '/login'
    end
    erb :'notes/new'
  end
end
