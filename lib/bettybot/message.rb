module Bettybot

  class Message

    attr_reader :author, :time, :text, :data

    def initialize(author, time, text, data = nil)
      @author = author
      @time = time
      @text = text
      @data = data
    end

    def to_hash
      { author: @author, time: @time, text: @text, data: @data }
    end

    def self.from_hash(hash)
      Message.new hash['author'], hash['time'], hash['text'], hash['data']
    end

  end

end
