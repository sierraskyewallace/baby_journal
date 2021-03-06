ENV['SINATRA_ENV'] ||= "development"
ENV['SINATRA_ENV'] ||= ENV['RACK_ENV']
ENV['RAILS_ENV'] = ENV['SINATRA_ENV']

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'].to_sym)

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require './app/controllers/application_controller'
require_all 'app'
