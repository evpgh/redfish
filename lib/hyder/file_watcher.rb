# frozen_string_literal: true

require "listen"

module Hyder
  class FileWatcher
    def initialize(rebuild_method)
      @listener = Listen.to("src") do |_modified, _added, _removed|
        rebuild_method.call
      end
    end

    def start
      @listener.start # not blocking
      sleep
    end
  end
end
