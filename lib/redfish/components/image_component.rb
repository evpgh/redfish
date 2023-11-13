module Redfish
  class ImageComponent < Component
    def render
      "<img src='#{@properties[:src]}' alt='#{@properties[:alt]}' style='#{@properties[:style]}' />"
    end
  end
end
