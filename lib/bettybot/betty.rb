module Bettybot

  class Betty

    def reply_to(message)
      Bettybot::Reply.new message
    end

  end
end
