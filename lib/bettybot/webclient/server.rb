$:.push File.expand_path("../../..", __FILE__)

require 'sinatra'
require 'bettybot'

require 'coffee-script'

get '/application.js' do
  coffee :application
end

get '/' do
  betty = Bettybot::Betty.new
  @messages = betty.memories
  erb :index
end

post '/' do
  betty = Bettybot::Betty.new
  betty.reply_to Bettybot::Message.new('You', Time.now, params[:message])
  redirect '/#latest'
end

helpers do
  include Rack::Utils
  alias_method :h, :escape_html

  def message_attributes(message, messages)
    attributes = ''
    attributes += ' id="latest"' if message == messages.last
    attributes += ' class="message'
    attributes += ' mirror' if message.author != 'Betty'
    attributes += '"'
  end

  def author_avatar(message)
    "<img src=\"/#{message.author == 'Betty' ? 'bot' : 'human'}.png\" width=\"48\" height=\"48\" alt=\"\" />"
  end

  def media_from(message)
    unless message.data.nil?
      if message.data.has_key? 'url'
        if File.extname(message.data['url']).match /\.(jpg|gif|png|jpeg)/i
          "<br /><img src=\"#{message.data['url']}\" alt=\"\" />"
        end
      end
    end
  end
end
