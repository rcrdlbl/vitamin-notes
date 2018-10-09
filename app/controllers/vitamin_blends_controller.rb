class VitaminBlendsController < ApplicationController
  get '/vitamins' do
    Helpers.redirect_if_not_logged_in(session)
    @vitamins = VitaminBlend.all
    erb :'vitamin_blends/all'
  end
end
