module Redfish
  class Component
    def initialize(properties = {})
      @properties = properties
    end

    def render
      raise NotImplementedError, "Each component must implement its own render method"
    end
  end
end
