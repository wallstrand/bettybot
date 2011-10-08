module Bettybot

  class Message

    attr_reader :author, :time, :text, :object

    def initialize(author, time, text, object = nil)
      @author = author
      @time = time
      @text = text
      @object = object
    end
  end

end
