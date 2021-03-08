class UpdatesController < ApplicationController

  # GET: /updates
  get "/updates" do
    redirect_if_not_logged_in
    @updates = Update.all 
    erb :"updates/index"
  end

  # GET: /updates/new
  get "/updates/new" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    erb :"updates/new"
  end

  # POST: /updates
  post "/updates" do
    redirect_if_not_logged_in 
    unless Update.valid_params?(params)
      redirect "/updates/new?error=No Updates Here!"
    end
    Update.create(params)
    redirect "/updates"
  end
  

  # GET: /updates/5
  get "/updates/:id" do
    redirect_if_not_logged_in 
    @updates = Update.find(params[:id])
    erb :'updates/show'
  end

  # GET: /updates/5/edit
  get "/updates/:id/edit" do
    redirect_if_not_logged_in 
    @error_message = params[:error]
    @updates = Update.find(params[:id])
    erb :'updates/edit'
  end

  # PATCH: /updates/5
  patch "/updates/:id" do
    redirect_if_not_logged_in 
    @updates = Update.find(params[:id])
    unless Update.valid_params?(params)
      redirect "/updates/#{@club.id}/edit?error=No Updates Here!"
    end
    @updates.update(params.select{|p|p=="weight" || p=="height" || p=="baby_id"})
    redirect "/clubs/#{@club.id}"
  end

  # DELETE: /updates/5/delete
  delete "/updates/:id/delete" do
    @updates = Update.find(params[:id])
    Update.destroy 
    redirect "/updates"
  end
end
