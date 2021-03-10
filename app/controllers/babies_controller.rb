class BabiesController < ApplicationController

  # GET: /babies
  get '/babies' do
    redirect_if_not_logged_in
    @user = current_user
    @babies = current_user.babies
    if logged_in?
    erb :'/babies/index'
    else 
      redirect '/login'
  end
end

  # GET: /babies/new
  get "/babies/new" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    erb :"/babies/new"
  end

  # POST: /babies
  post "/babies" do
    rredirect_if_not_logged_in
    unless Baby.valid_params?(params)
      redirect "/babies/new?error=No Babies Here!"
    end
    Baby.create(params)
    redirect "/babies"  #may need to change 
  end

  # GET: /babies/5
  get "/babies/:id" do
    redirect_if_not_logged_in
    @babies = Baby.find(params[:id])
    erb :'babies/show'
  end

  # GET: /babies/5/edit
  get "/babies/:id/edit" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @babies = Baby.find_by(params[:id])
    erb :'babies/edit'
  end

  # PATCH: /babies/5
  post "/babies/:id" do
    redirect_if_not_logged_in
    @babies = Baby.find(params[:id])
    unless Baby.valid_params?(params)
      redirect "/babies/#{@babies.id}/edit?error=No Babies Here"
    end
    @babies.update(params.select{|p|p=="name" || p=="age" || p=="age"})
    redirect "/babies/#{@babies.id}"
  end


  # DELETE: /babies/5/delete
  delete "/babies/:id/delete" do
    @babies = Baby.find(params[:id])
    Baby.destroy 
    redirect "/babies/show"
  end
end 
