class BabiesController < ApplicationController


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

    get "/babies/new" do
      authenticate_user
      @posts = Post.all
      erb :"/babies/new"
    end

    post "/babies" do
      authenticate_user
      unless Baby.valid_params?(params)
        redirect "/babies/new"                 
      end
      @babies = current_user.babies.create(params)
      @babies.save
      redirect "/babies" 
    end
  

    get "/babies/:id" do
      authenticate_user
      @babies = Baby.find_by_id(params[:id])
      erb :'babies/show'
    end

    get "/babies/:id/edit" do
      authenticate_user
      @babies = Baby.find_by_id(params[:id])
      erb :'babies/edit'
    end

    post "/babies/:id" do
      authenticate_user
      @babies = Baby.find_by_id(params[:id])
      unless Baby.valid_params?(params)
        redirect "/babies/#{@babies.id}/edit"   
      end
      @babies.update(params)
      @babies.save
      redirect "/babies/#{@babies.id}"
    end
  
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