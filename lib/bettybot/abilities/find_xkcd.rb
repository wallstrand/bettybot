require 'bettybot/ability'

require 'mechanize'

module Bettybot::Abilities

 class FindXKCD < Bettybot::Ability

  def process(message)
    matches = /xkcd.*about (.+)/i.match message.text
    if matches
      search_phrase = matches[1]

      agent = Mechanize.new { |agent|
        agent.user_agent_alias = 'Mac Safari'
      }

      url = ''
      alt = ''
      title = ''

      agent.get('http://google.com/') do |page|
        search_result = page.form_with(:name => 'f') do |search|
          search.q = "site:xkcd.com #{search_phrase}"
        end.submit

        li = (search_result/"li.g").first
        link = (li/"a")

        url = link.first.attribute('href')
      end

      if url.to_s.match /xkcd\.com/
        agent.get(url) do |page|
          img = page.search 'img[title]'
          url = img.attribute('src')
          alt = img.attribute('alt')
          title = img.attribute('title')
        end
        if url.to_s.length > 0 && alt.to_s.length > 0 && title.to_s.length > 0
          text = "Here you go: #{alt} - #{url} [#{title}]"
          data = { url: url.to_s }
          say text, data
        else
          say "Sorry none found!"
        end
      else
        say "Sorry none found!"
      end
    else
      nil
    end
  end

 end

end

