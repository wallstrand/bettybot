# encoding: utf-8

require 'bettybot/ability'
require 'net/http'

module Bettybot::Abilities
 class ForecastWeather < Bettybot::Ability
  def process(message)
    if message.text.match /umbrella/i
      say will_it_rain_in_jkpg_today? ? "You should bring an umbrella today!" : "There will be no rain today mate!"
    else
      nil
    end
  end

  def will_it_rain_in_jkpg_today?
    !Net::HTTP.get('www.yr.no', '/place/Sweden/J%C3%B6nk%C3%B6ping/J%C3%B6nk%C3%B6ping/forecast.rss').include? "No precipitation"
  end
 end
end

