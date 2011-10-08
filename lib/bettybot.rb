require "bettybot/version"

require 'bettybot/betty'
require 'bettybot/message'
require 'bettybot/datastore'
require 'bettybot/ability'
Dir[File.dirname(__FILE__) + "/bettybot/abilities/*.rb"].each {|file| require file }

module Bettybot
  # Your code goes here...
end
