#!/usr/bin/env ruby

$:.push File.expand_path("../../..", __FILE__)

require 'sinatra'
require 'bettybot'

get '/' do
  erb :index
end

post '/' do
  betty = Bettybot::Betty.new
  @message = betty.reply_to Bettybot::Message.new('User', Time.now, params[:message])
  erb :index
end
