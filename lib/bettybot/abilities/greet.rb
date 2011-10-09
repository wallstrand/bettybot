require 'bettybot/ability'

module Bettybot::Abilities
 class Greet < Bettybot::Ability
  def process(message)
    greetings = ['Hello!', 'Yo!', 'Hi!']
    if message.text.match /(hi|hello|yo)([!\.\s\?]|$)/i
      say greetings.sample
    else
      nil
    end
  end

  def description
    "Say hello"
  end

 end
end
