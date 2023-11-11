# frozen_string_literal: true

require "minitest/autorun"
require "fileutils"
require_relative "../../lib/hyder/page_builder"
require_relative "../test_helper"

module Hyder
  class TestPageBuilder < Minitest::Test
    def setup
      @src_dir = "test_src"
      @dest_dir = "test_dest"
      @page_builder = Hyder::PageBuilder.new(src_dir: @src_dir, dest_dir: @dest_dir)

      # Create test directories and files
      FileUtils.mkdir_p(@src_dir)
      FileUtils.mkdir_p(@dest_dir)
      File.write(File.join(@src_dir, "test.md"), "# Test Markdown")
      File.write(File.join(@src_dir, "test.erb"), "<h1>Test ERB</h1>")
      File.write(File.join(@src_dir, "test.txt"), "Test Text")
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
      assert File.exist?(File.join(@dest_dir, "test.txt"))  # Text file copied
    end

    # You can add more tests for each method and edge cases
  end
end
