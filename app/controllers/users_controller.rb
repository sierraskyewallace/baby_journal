require './config/environment'
require 'sinatra/flash'
class UsersController < ApplicationController


  get '/users/:id' do 
    if !logged_in?
      redirect '/login'   #may need to change to specific login page 
  end
  @user = User.find(params[:id])
  if !@user.nil? && @user == current_user
    erb :'users/show'
  else
    redirect '/login' #may need to change to specific login page
  end
end

  get '/login' do 
    @users = User.all
    if !session[:user_id]
      erb :'users/login'
    else
      redirect '/babies'  #may need to change to specific login page
    end
  end

  post "/login" do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/babies"
    else 
      flash.now[:error] = "Incorrect Username/Password. Please try again or Register above."
      erb :"users/login"
    end
  end
  

  
  get '/register' do 
    if !session[:user_id]
      erb :'users/new'
    else 
      redirect '/babies'
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

  get "/users/:slug" do
    @user = User.find_by_slug(params[:slug])
    if @user != current_user
      redirect "/users/#{current_user.slug}"
    else
      @babies = @user.babies
      redirect "/babies/index"
    end
  end

   

end



