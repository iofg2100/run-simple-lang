require 'sinatra'
require 'less'
require 'coffee-script'

if development?
  require 'sinatra/reloader'
end

get '/' do
  haml :index
end

get '/css/style.css' do
  less :style
end

get '/js/app.js' do
  coffee :app
end