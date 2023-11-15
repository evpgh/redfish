module Redfish
  module Components
    class Image < Redfish::Component
      def render
        "<img src='#{@properties[:src]}' alt='#{@properties[:alt]}' style='#{@properties[:style]}' />"
      end
    end
  end
end
