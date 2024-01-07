# frozen_string_literal: true

require "minitest/autorun"
require_relative "../../../lib/redfish/component"
require_relative "../../../lib/redfish/components/text"
require_relative "../../test_helper"

module Components
  class TextTest < Minitest::Test
    def test_render_no_style
      component = Redfish::Components::Text.new(content: "Hello World")
      assert_equal "<p>Hello World</p>", component.render
    end

    def test_render_with_style
      component = Redfish::Components::Text.new(content: "Hello World", class: "w3-container w3-padding-16")
      assert_equal "<p class=\"w3-container w3-padding-16\">Hello World</p>", component.render
    end
  end
end
