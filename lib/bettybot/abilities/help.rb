require 'bettybot/ability'

module Bettybot::Abilities

 class Help < Bettybot::Ability

  def process(message)
    if message.text.match /^help$/i
      return say "This is the help text"
    end

    matches = message.text.match /^(help|usage)\s(.+)$/i

    if matches
      Bettybot::Ability::all.each do |klass|
        if klass.name.match /#{matches[2]}/i
          ability = klass.new
          return say ability.usage
        end
      end
    end
    nil
  end

  def description
    "Get help"
  end

  def usage
    "Type help or usage and an ability to get the usage for it."
  end

 end
end

