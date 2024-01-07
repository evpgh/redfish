# frozen_string_literal: true

module Redfish
  module Renderers
    class Base
      def initialize(template)
        @template = template
      end

      def render(input)
        raise NotImplementedError
      end
    end
  end
end
