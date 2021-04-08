require './config/environment'
require 'rack-flash'
class UsersController < ApplicationController


  get '/users/:id' do 
    if !logged_in?
      redirect '/login'    
  end
  @user = User.find(params[:id])
  if !@user.nil? && @user == current_user
    erb :'users/show'
  else
    redirect '/login' 
  end
end

  get '/login' do 
    @users = User.all
    if !session[:user_id]
      erb :'users/login'
    else
      redirect '/babies'  
    end
  end

  post "/login" do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/"
    else 
      flash.now[:error] = "Incorrect Username/Password. Please try again or Register above."
      erb :"users/login"
    end
  end
  

  
  get '/register' do 
    if !session[:user_id]
      erb :'users/new'
    else 
      redirect '/'
    end
  end

  post '/register' do 
      @user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
      if @user.save 
      session[:user_id] = @user.id
      erb :index
      else
      flash.now[:error] = "Please enter a valid email address."
      erb :"users/new"
    end
  end



  get '/logout' do 
    if session[:user_id] != nil
      session.clear
      redirect to '/login'
    else
      redirect to '/'
    end
  end
end



