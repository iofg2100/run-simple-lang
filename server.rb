require 'sinatra'
require 'less'
require 'coffee-script'
require 'erb'
require 'json'

if development?
  require 'sinatra/reloader'
end

get '/' do
  @editor_config = {
    value: "test",
    lineNumbers: "true"
  }.to_json
  haml :index
end

get '/css/style.css' do
  less :style
end

post '/run' do
  puts "run"
end