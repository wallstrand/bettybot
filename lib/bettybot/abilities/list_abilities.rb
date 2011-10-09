require 'bettybot/ability'

module Bettybot::Abilities

 class ListAbilities < Bettybot::Ability

   def process(message)
    if message.text.match /^(list )?abilities$/i
      text = ''
      Bettybot::Ability::all.each do |klass|
        ability = klass.new
        text += "#{klass.name.split('::').last} - #{ability.description}\n"
      end
      say "\n#{text}"
    else
      nil
    end
  end

   def description
     "Lists all abilities"
   end

   def usage
     "Type list abilities or only abilities to list all abilities"
   end

 end
end


