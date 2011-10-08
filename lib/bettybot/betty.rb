module Bettybot

  class Betty

    COLLECTION_NAME = 'messages'

    def reply_to(message)
      remember message
      Bettybot::Ability::all.each do |klass|
        ability = klass.new
        reply = ability.process message

        return remember reply if reply
      end

      nil
    end

    def memories
      datastore = Datastore.new COLLECTION_NAME
      datastore.all.map do |hash|
        Message.from_hash hash
      end
    end

    private

    def remember(message)
      datastore = Datastore.new COLLECTION_NAME
      datastore.store message
    end

  end
end
