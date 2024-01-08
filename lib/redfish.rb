# frozen_string_literal: true

require_relative "../config/initializers/zeitwerk"
require_relative "redfish/version"
module Redfish
  class Error < StandardError; end

  def self.root
    File.expand_path("..", __dir__)
  end

  def self.build
    builder = PageBuilder.new
    builder.build_site
  end

  def self.watch
    builder = PageBuilder.new
    watcher = FileWatcher.new(-> { builder.build_site })
    watcher.start
  end
end
