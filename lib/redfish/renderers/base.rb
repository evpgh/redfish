module Redfish
  module Renderers
    class Base
      def render(input)
        raise NotImplementedError
      end
    end
  end
end
