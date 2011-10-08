#!/usr/bin/env ruby

require 'sinatra'

require_relative '../lib/bettybot'

get '/' do
  erb :index
end

post '/' do
  betty = Betty.new
  @response = betty.respond_to params[:message]
end
