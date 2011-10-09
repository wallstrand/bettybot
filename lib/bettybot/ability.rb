module Bettybot

  class Ability

    @@all = []

    def self.inherited(base)
      all << base
    end

    def self.all
      return @@all
    end

    def say(message, data = nil)
      Bettybot::Message.new 'Betty', Time.now, message, data
    end

    def description
      "This is the standard ability description. Each ability should overwrite this."
    end

    def usage
      "This is the standard ability usage description. Each ability should overwrite this."
    end

  end

end

