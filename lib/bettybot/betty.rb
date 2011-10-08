module Bettybot

  class Betty

    COLLECTION_NAME = 'messages'

    def reply_to(message)
      reply = Bettybot::Message.new 'Betty', Time.now, message.text
      remember message, reply
    end

    def memories
      datastore = Datastore.new COLLECTION_NAME
      datastore.all.map do |hash|
        Message.from_hash hash
      end
    end

    private

    def remember(message, reply)
      datastore = Datastore.new COLLECTION_NAME
      datastore.store message
      datastore.store reply
    end

  end
end
