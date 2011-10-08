#encoding: utf-8

require 'bettybot/ability'

require 'mechanize'

module Bettybot::Abilities

 class ShowTodaysLunch < Bettybot::Ability

  def process(message)
    matches = /what'?s for lunch|lunch options/i.match message.text
    if matches
      agent = Mechanize.new { |agent|
        agent.user_agent_alias = 'Mac FireFox'
      }

      @location = '36'
      @approved_resturants = ['8 Glas', 'Aqua Dinners and Drinks', 'En Italienare & en Grek', 'Ester Kök & Bar', 'Johans Café & Matsal', 'La Dolce Vita Ristorante', 'Smålandskolonin', 'Sofiehof']

      lunches = []
      url = "http://www.kvartersmenyn.se/start/city/#{@location}"
      agent.get(url) do |page|
        tables = page.root.css '.tblList'
        tables.each do |table|
          resturant = table.search('span').first.text.strip
          food = table.search('td[valign="top"]').last.text.strip
          lunches << { resturant: resturant, food: food } if @approved_resturants.include? resturant
        end
      end

      unless lunches.empty?
        text = ''
        lunches.each do |lunch|
          text += "\n#{lunch[:resturant]}\n#{lunch[:food]}\n"
        end
        say text
      else
        say "No lunch for you!"
      end
    else
      nil
    end
  end

 end

end
