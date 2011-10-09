require 'bettybot/ability'

require 'mechanize'

module Bettybot::Abilities

 class Calculator < Bettybot::Ability

  def process(message)

    matches = message.text.match /^c (.+)/i
    if matches
      agent = Mechanize.new { |agent|
        agent.user_agent_alias = 'Mac Safari'
      }

      agent.get('http://google.com/') do |page|
        search_result = page.form_with(:name => 'f') do |search|
          search.q = matches[1]
        end.submit

        text = search_result.root.search("//span[@class='nobr']/h2[@class='r']").to_s
        text = text.gsub(/(<\/?[^>]*>|\n|\r)/, "")

        return say text if text.size > 0
      end
    end
    nil
  end

  def description
    "A useful calculator"
  end

  def usage
    "Type c and a mathematical expression to get the answer. Example 'c 4 * 4' and 'c 4m in cm'"
  end

 end
end

