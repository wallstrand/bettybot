$:.push File.expand_path("../../..", __FILE__)

require 'sinatra'
require 'bettybot'

require 'coffee-script'

get '/application.js' do
  coffee :application
end

get '/' do
  betty = Bettybot::Betty.new
  @messages = betty.memories
  erb :index
end

post '/' do
  betty = Bettybot::Betty.new
  betty.reply_to Bettybot::Message.new('You', Time.now, params[:message])
  redirect '/#latest'
end
