require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "babiesrock"
  end

  get "/" do
    erb :index
    end

    helpers do
      def redirect_if_not_logged_in
        if !logged_in?
          redirect "/login?error=You have to be logged in to do that"
        end
      end
  
      def logged_in?
        !!session[:user_id]
      end
  
      def current_user
        User.find(session[:user_id])
      end
    end
  end
  
  
