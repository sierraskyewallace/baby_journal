require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  
  configure do
    use Rack::Flash
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "babiesrock"
  end

  get "/" do
    erb :index
    end

    helpers do
      def logged_in?
        !!session[:user_id]
      end
  
      def current_user
        User.find(session[:user_id])
      end

      def authenticate_user 
        if !logged_in?
            redirect '/login'
        end
      end
    end
  end
  
