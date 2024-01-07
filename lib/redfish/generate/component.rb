# frozen_string_literal: true

require "fileutils"
require "zeitwerk"

module Redfish
  module Generate
    class Component
      SRC_DIR = "src/components"
      TEST_DIR = "test/components"

      def initialize(component_name)
        @component_name = component_name
      end

      def generate
        class_name = camelize(@component_name)
        filename = underscore(@component_name)
        create_directories
        create_component_file(class_name, filename)
        create_test_file(class_name, filename)
      end

      private

      def camelize(str)
        str.split("_").map(&:capitalize).join
      end

      # Converts a string to snake_case
      def underscore(str)
        str.gsub("::", "/")
           .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
           .gsub(/([a-z\d])([A-Z])/, '\1_\2')
           .tr("-", "_")
           .downcase
      end

      def create_directories
        FileUtils.mkdir_p(SRC_DIR.to_s)
        FileUtils.mkdir_p(TEST_DIR.to_s)
      end

      def create_test_file(class_name, filename)
        test_path = "#{TEST_DIR}/test_#{filename}.rb"
        File.write(test_path, test_content)
        puts "#{class_name} component test generated successfully."
      end

      def create_component_file(class_name, filename)
        component_path = "#{SRC_DIR}/#{filename}.rb"
        File.write(component_path, component_content)
        puts "#{class_name} component generated successfully."
      end

      def component_content
        <<-RUBY
  module Redfish
    module Components
      class #{class_name} < Redfish::Component
        def self.template
          <<~ERB
            <!-- Default HTML structure for #{class_name} -->
          ERB
        end
      end
    end
  end
        RUBY
      end

      def test_content
        <<-RUBY
  require 'minitest/autorun'
  require_relative '../src/components/#{filename}'

  class #{class_name}Test < Minitest::Test
    def test_render_default
      component = Redfish::#{class_name}.new
      assert_equal "<!-- Expected output -->", component.render.strip
    end
  end
        RUBY
      end
    end
  end
end
