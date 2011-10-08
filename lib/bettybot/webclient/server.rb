#!/usr/bin/env ruby

$:.push File.expand_path("../../..", __FILE__)

require 'sinatra'
require 'bettybot'

get '/' do
  erb :index
end

post '/' do
  betty = Bettybot::Betty.new
  @reply = betty.reply_to params[:message]
  erb :index
end
