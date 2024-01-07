# frozen_string_literal: true

require "minitest/autorun"
require_relative "../../../lib/redfish/components/template_helpers"

class TemplateHelpersTest < Minitest::Test
  include Redfish::Components::TemplateHelpers

  def test_text_helper
    result = text("Sample Text")
    # Assuming the render method of Text component returns a string
    assert_equal "<p>Sample Text</p>", result
  end

  def test_image_helper
    result = image("/path/to/image.png")
    # Assuming the render method of Image component returns an HTML img tag
    assert_equal "<img src='/path/to/image.png' alt='' class=''/>", result
  end

  def test_navbar_helper
    result = navbar(links: %w[Home About Contact])
    # Assuming the render method of Navbar component returns an HTML navbar
    assert_equal "<nav class=\"w3-bar w3-border\"><a class=\"w3-bar-item w3-button\" href=\"\">Home</a><a class=\"w3-bar-item w3-button\" href=\"\">About</a><a class=\"w3-bar-item w3-button\" href=\"\">Contact</a></nav>", # rubocop:disable Metrics/LineLength
                 result
  end

  # Additional tests for other options and edge cases...
end
