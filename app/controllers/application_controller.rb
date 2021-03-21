require './config/environment'
require 'sinatra/flash'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  use Rack::Flash
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
      def logged_in?
        !!session[:user_id]
      end
  
      def current_user
        User.find(session[:user_id])
      end
    end

  
  
