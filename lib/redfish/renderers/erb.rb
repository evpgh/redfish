module Redfish
  module Renderers
    class Erb < Base
      def render(input)
        ERB.new(input).result(binding)
      end
    end
  end
end
