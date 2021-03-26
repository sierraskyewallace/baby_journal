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
      @babies = Baby.find_by_id(params[:id])
      @babies = current_user.babies.create(params)
        if @babies.save 
          redirect "/babies"
        else
          flash[:error] = "Invalid input type for Age field. Please enter a number."
          redirect "/babies/new"
        end
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
      if logged_in?
        @babies.update(params)
        redirect "/babies/#{@babies.id}"
       else 
         redirect "/login"
       end
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

