module Redfish
  module Components
    class Navbar < Redfish::Component
      def self.template
        <<~ERB
          <nav class="w3-bar w3-border">
            <% @properties[:links].each do |text, href| %>
              <a class="w3-bar-item w3-button" href="<%= href %>"><%= text %></a>
            <% end %>
          </nav>
        ERB
      end
    end
  end
end
