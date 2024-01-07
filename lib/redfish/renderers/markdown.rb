# frozen_string_literal: true

require "redcarpet"

module Redfish
  module Renderers
    class Markdown < Base
      def renderer
        @renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
      end

      def render(input)
        content = renderer.render(input)
        @template.result(binding)
      end
    end
  end
end
