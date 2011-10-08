require 'mongo'

module Bettybot

  class Datastore

    def initialize(collection)
      if ENV['MONGOHQ_URL']
        uri = URI.parse(ENV['MONGOHQ_URL'])
        conn = Mongo::Connection.new(uri.host, uri.port)
        @db = conn.db(uri.path.gsub(/^\//, ''))
        @db.authenticate(uri.user, uri.password)
      else
        @db = Mongo::Connection.new.db 'bettybot'
      end

      @collection = @db.collection(collection)
    end

    def store(data)
      @collection.insert data.to_hash
    end

    def all
      @collection.find({}, {sort: 'time'})
    end

  end

end
