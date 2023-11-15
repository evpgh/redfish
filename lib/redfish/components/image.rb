module Redfish
  module Components
    class Image < Redfish::Component
      def render
        "<img src='#{@properties[:src]}' alt='#{@properties[:alt]}' class='#{@properties[:class]}'/>"
      end
    end
  end
end
