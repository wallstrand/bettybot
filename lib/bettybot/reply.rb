module Bettybot

  class Reply

    attr_reader :text, :object

    def initialize(text, object = nil)
      @text = text
      @object = object
    end
  end

end
