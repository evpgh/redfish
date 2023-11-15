require "redcarpet"

module Redfish
  module Renderers
    class Markdown < Base
      def renderer
        @renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
      end

      def render(input)
        renderer.render(input)
      end
    end
  end
end
