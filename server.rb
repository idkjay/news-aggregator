require 'sinatra'
require 'sinatra/reloader'

require 'pry'
require 'csv'


set :bind,'0.0.0.0'

get "/" do
  erb :index
end
