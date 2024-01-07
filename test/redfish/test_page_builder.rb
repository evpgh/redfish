# frozen_string_literal: true

require "minitest/autorun"
require "fileutils"
require_relative "../../lib/redfish/page_builder"
require_relative "../test_helper"

module Redfish
  class TestPageBuilder < Minitest::Test
    def setup # rubocop:disable Metrics/MethodLength
      @src_dir = "test_src"
      @dest_dir = "test_dest"
      FileUtils.mkdir_p(@src_dir)
      FileUtils.mkdir_p(@dest_dir)
      @template_file = File.join(@src_dir, "template.html.erb")
      @template_text = """<!DOCTYPE html>
<html>
  <head>
    <title>Redfish</title>
  </head>
  <body>
    <%= content %>
  </body>
</html>"""
      File.write(@template_file, @template_text) unless File.exist?(@template_file)
      # Create test directories and files
      FileUtils.mkdir_p(@src_dir)
      FileUtils.mkdir_p(@dest_dir)
      File.write(File.join(@src_dir, "test_md.md"), "# Test Markdown")
      File.write(File.join(@src_dir, "test_erb.erb"), "<h1>Test ERB</h1>")
    
      @page_builder = Redfish::PageBuilder.new(src_dir: @src_dir, dest_dir: @dest_dir, template: @template_file)
    end

    def teardown
      # Clean up test directories
      FileUtils.remove_dir(@src_dir) if Dir.exist?(@src_dir)
      FileUtils.remove_dir(@dest_dir) if Dir.exist?(@dest_dir)
    end

    def test_initialize
      assert_equal @src_dir, @page_builder.instance_variable_get(:@src_dir)
      assert_equal @dest_dir, @page_builder.instance_variable_get(:@dest_dir)
    end

    def test_build_site
      @page_builder.build_site

      assert File.exist?(File.join(@dest_dir, "test_md.html")) # Markdown converted to HTML
      assert File.exist?(File.join(@dest_dir, "test_erb.html")) # ERB converted to HTML
    end

    def test_build_content_markdown
      content = @page_builder.send(:process_file, File.join(@src_dir, "test_md.md"))
      assert content.include? "<h1>Test Markdown</h1>\n"
    end

    def test_build_content_erb
      content = @page_builder.send(:process_file, File.join(@src_dir, "test_erb.erb"))
      assert content.include? "<h1>Test ERB</h1>\n"
    end

    def test_write_output
      test_content = "<h1>Test Content</h1>\n"
      test_file = File.join(@src_dir, "test.html")
    
      @page_builder.send(:write_output, test_file, test_content)
    
      assert File.exist?(File.join(@dest_dir, "test.html"))
      assert_equal test_content, File.read(File.join(@dest_dir, "test.html"))
    end

    def test_load_template
      template = @page_builder.send(:load_template, "test_src/template.html.erb")
      content = "yielded content"
      expected_text = "<!DOCTYPE html>\n<html>\n  <head>\n    <title>Redfish</title>\n  </head>\n  <body>\n    #{content}\n  </body>\n</html>"
      assert_equal expected_text, template.result(binding)
    end
  end
end
