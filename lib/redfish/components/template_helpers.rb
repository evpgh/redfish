module Redfish
  module Components
    module TemplateHelpers
      def text(content, **options)
        Redfish::Components::Text.new(content: content, **options).render
      end

      def image(source, **options)
        Redfish::Components::Image.new(src: source, **options).render
      end

      def navbar(**options)
        Redfish::Components::Navbar.new(**options).render
      end
    end
  end
end
