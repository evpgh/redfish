# frozen_string_literal: true

require "minitest/autorun"
require "fileutils"
require_relative "../../lib/redfish/page_builder"
require_relative "../test_helper"

module Redfish
  class TestPageBuilder < Minitest::Test
    def setup
      @src_dir = "test_src"
      @dest_dir = "test_dest"
      @page_builder = Redfish::PageBuilder.new(src_dir: @src_dir, dest_dir: @dest_dir)

      # Create test directories and files
      FileUtils.mkdir_p(@src_dir)
      FileUtils.mkdir_p(@dest_dir)
      File.write(File.join(@src_dir, "test.md"), "# Test Markdown")
      File.write(File.join(@src_dir, "test.erb"), "<h1>Test ERB</h1>\n")
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

      assert File.exist?(File.join(@dest_dir, "test.html")) # Markdown converted to HTML
      assert File.exist?(File.join(@dest_dir, "test.html")) # ERB converted to HTML
    end

    def test_build_content_markdown
      content = @page_builder.send(:process_file, File.join(@src_dir, "test.md"))
      assert_equal "<h1>Test Markdown</h1>\n", content
    end

    def test_build_content_erb
      content = @page_builder.send(:process_file, File.join(@src_dir, "test.erb"))
      assert_equal "<h1>Test ERB</h1>\n", content
    end

    def test_markdown_to_html
      content = @page_builder.send(:markdown_to_html, File.join(@src_dir, "test.md"))
      assert_equal "<h1>Test Markdown</h1>\n", content
    end

    def test_erb_to_html
      content = @page_builder.send(:erb_to_html, File.join(@src_dir, "test.erb"))
      assert_equal "<h1>Test ERB</h1>\n", content
    end
    # You can add more tests for each method and edge cases
  end
end
