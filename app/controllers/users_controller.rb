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
    @error_message = params[:error]
    if !session[:user_id]
      erb :'users/login'
    else
      redirect '/login'  #may need to change to specific login page
    end
  end
end

  post '/login' do 
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/login"
    else
      redirect to '/register'
    end
  end
  

  
  get '/register' do 
    if !session[:user_id]
      erb :'users/new'
    else
      redirect to "/index"  #^^
    end
  end
  

  post '/register' do 
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/register'
    else
      @user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
      session[:user_id] = @user.id
      redirect '/index'   #^^
    end
  end



  get '/logout' do 
    if session[:user_id] != nil
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end



