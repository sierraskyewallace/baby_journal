class BabiesController < ApplicationController

    # GET: /babies
    get '/babies' do
      authenticate_user
      @babies = Baby.all
      if logged_in?
        @user = current_user
      @babies = current_user.babies
      erb :'/babies/index'
      else 
        redirect '/login'
    end
  end
  
    # GET: /babies/new
    get "/babies/new" do
      authenticate_user
      @posts = Post.all
        ##change error to flash
      erb :"/babies/new"
    end
  
    # POST: /babies
    post "/babies" do
      authenticate_user
      unless Baby.valid_params?(params)
        redirect "/babies/new"                  ##change error to flash
      end
      @babies = current_user.babies.create(params)
      @babies.save
      redirect "/babies"  #may need to change 
    end
  
    # GET: /babies/5
    get "/babies/:id" do
      authenticate_user
      @babies = Baby.find_by_id(params[:id])
      erb :'babies/show'
    end
  
    # GET: /babies/5/edit
    get "/babies/:id/edit" do
      authenticate_user
      ###error message for redirect to login
      @babies = Baby.find_by_id(params[:id])
      erb :'babies/edit'
    end
  
    # PATCH: /babies/5
    post "/babies/:id" do
      authenticate_user
      @babies = Baby.find_by_id(params[:id])
      unless Baby.valid_params?(params)
        redirect "/babies/#{@babies.id}/edit"   ##change to flash error and redir
      end
      @babies.update(params)
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