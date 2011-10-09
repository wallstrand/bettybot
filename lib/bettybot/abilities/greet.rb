require 'bettybot/ability'

module Bettybot::Abilities
 class Greet < Bettybot::Ability

  def initialize
    @greetings = ['Hello!', 'Yo!', 'Hi!']
  end

  def process(message)
    if message.text.match /(hi|hello|yo)([!\.\s\?]|$)/i
      say @greetings.sample
    else
      nil
    end
  end

  def description
    "Say hello"
  end

  def usage
    "Type #{@greetings.map{ |word| word.downcase[0...-1] }.join(' or ')} to get a greeting back"
  end

 end
end
