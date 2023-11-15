module Redfish
  module Components
    class Text < Redfish::Component
      def self.template
        <<~ERB.gsub(/^\s+/, "")
          <% if @properties[:class] %>
            <p class="<%= @properties[:class] %>"><%= @properties[:content] %></p>
          <% else %>
            <p><%= @properties[:content] %></p>
          <% end %>
        ERB
      end
    end
  end
end
