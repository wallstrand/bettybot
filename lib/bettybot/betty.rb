module Bettybot

  class Betty

    def reply_to(message)
      reply = Bettybot::Message.new 'Betty', Time.now, message.text
      remember message, reply
    end

    private

    def remember(message, reply)
      reply
    end

  end
end
