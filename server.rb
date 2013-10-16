require 'sinatra'
require 'less'
require 'coffee-script'
require 'haml'
require 'json'
require 'pathname'
require 'stringio'

$:.unshift Pathname.new(__FILE__) + "../simple-lang"
require 'simple-lang'

helpers do
  def run(source)
    result_io = StringIO.new

    engine = SimpleLang::Engine.new result_io
    source = params[:source]
    engine.run source

    result_io.string
  end
end

get '/' do
  logger.info "index"
  haml :index
end

get '/css/style.css' do
  less :style
end

post '/run' do
  logger.info params[:source]
  result = run(params[:source])
  {result: result}.to_json
end