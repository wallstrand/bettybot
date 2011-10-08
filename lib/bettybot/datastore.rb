require 'mongo'

module Bettybot

  class Datastore

    def initialize(collection)
      @db = Mongo::Connection.new.db 'bettybot'
      @collection = @db.collection(collection)
    end

    def store(data)
      @collection.insert data.to_hash
    end

    def all
      @collection.find
    end

  end

end
