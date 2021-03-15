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
      @error_message = params[:error]  ##change error to flash
      erb :"/babies/new"
    end
  
    # POST: /babies
    post "/babies" do
      redirect_if_not_logged_in
      unless Baby.valid_params?(params)
        redirect "/babies/new"                  ##change error to flash
      end
      @babies = current_user.babies.create(name: params[:name], age: params[:age], gender: params[:gender])
      @babies.save
      redirect "/babies"  #may need to change 
    end
  
    # GET: /babies/5
    get "/babies/:id" do
      redirect_if_not_logged_in
      @babies = Baby.find_by_id(params[:id])
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
      @babies.update(params.select{|p|p=="name" || p=="age" || p=="gender"})
      redirect "/babies/#{@babies.id}"
    end
  
  
    # DELETE: /babies/5/delete
    delete '/babies/:id/delete' do
      if logged_in?
        @babies = Baby.find_by_id(params[:id])
        if @babies && @babies.user == current_user
          @babies.delete
          redirect "/babies"
        else
          redirect "/login"
        end
      end
    end
    end