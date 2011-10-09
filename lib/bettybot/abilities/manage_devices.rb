require 'bettybot/ability'

module Bettybot::Abilities
 class ManageDevices < Bettybot::Ability
  def process(message)
    if message.text.match /turn.*on/i
      return installation_instructions unless telldus_installed?
      turn_on 1
    elsif message.text.match /turn.*off/i
      return installation_instructions unless telldus_installed?
      turn_off 1
    end
  end

  def turn_on(id)
    if is_off? 1
      `tdtool --on #{id}`
      say 'Let there be light!'
    else
      say "It's already on dumbass!"
    end
  end

  def turn_off(id)
    if is_on? 1
      `tdtool --off #{id}`
      say 'There you go!'
    else
      say "It's already off dumbass!"
    end
  end

  def is_off?(id)
    `tdtool -l`.include? "OFF"
  end

  def is_on?(id)
    !is_off?(id)
  end

  def telldus_installed?
    begin
      `tdtool --help`
    rescue
      return false
    end
    true
  end

  def installation_instructions
    say 'You have to install Telldus Center for me to do that! Go to http://www.telldus.se/products/nativesoftware'
  end
 end
end

