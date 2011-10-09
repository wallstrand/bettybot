require 'bettybot/ability'

module Bettybot::Abilities

 class Help < Bettybot::Ability

   def process(message)
    if message.text.match /^help$/i
      say "This is the help text"
    else
      nil
    end
  end

 end
end

