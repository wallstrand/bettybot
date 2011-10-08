module Bettybot

  class Ability

    @@all = []

    def self.inherited(base)
      all << base
    end

    def self.all
      return @@all
    end

    def say(message)
      Bettybot::Message.new 'Betty', Time.now, message
    end
  end

end

