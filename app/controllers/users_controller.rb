class UsersController < ApplicationController

  get '/users/:id' do 
    @users = User.find(params[:id])
    erb :"users/index"
  end

  get '/login' do 
  end

  post '/login' do 
  end

  
  get '/register' do 
    "hello"
  end

  post '/register' do 
  end


  get '/logout' do 
  end
end


