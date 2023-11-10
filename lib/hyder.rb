# frozen_string_literal: true

require_relative '../config/initializers/zeitwerk.rb'
require_relative "hyder/version"

module Hyder
  class Error < StandardError; end
  class TestClass
    def self.say_hello
      "Hello from TestClass"
    end
  end

  def self.test_autoload
    TestClass.say_hello
  end
end
