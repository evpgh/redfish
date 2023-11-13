module Redfish
  class TextComponent < Component
    def render
      "<p style='#{@properties[:style]}'>#{@properties[:content]}</p>"
    end
  end
end
