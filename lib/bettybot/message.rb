module Bettybot

  class Message

    attr_reader :author, :time, :text, :object

    def initialize(author, time, text, object = nil)
      @author = author
      @time = time
      @text = text
      @object = object
    end

    def to_hash
      { author: @author, time: @time, text: @text, object: @object }
    end

    def self.from_hash(hash)
      Message.new hash['author'], hash['time'], hash['text'], hash['object']
    end

  end

end
