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
  end

end

