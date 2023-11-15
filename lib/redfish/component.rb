require 'erb'

module Redfish
  class Component
    def initialize(properties = {})
      @properties = properties
    end

    def self.template
      raise NotImplementedError, "Each component must implement its own render method"
    end

    def render
      template = self.class.template
      ERB.new(trim(template)).result(binding)
    end

    private

    def trim(string)
      string.gsub(/>[\s\n]*</, "><").strip
    end
  end
end
