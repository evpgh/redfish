module Redfish
  module Renderers
    class Erb < Base
      def render(content)
        @template.result(binding)
      end
    end
  end
end
