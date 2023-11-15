# frozen_string_literal: true

require "fileutils"
require "erb"

module Redfish
  class PageBuilder
    def initialize(src_dir: "src", dest_dir: "dist")
      @src_dir = src_dir
      @dest_dir = dest_dir
    end

    def build_site
      Dir.glob(File.join(@src_dir, "**", "*")).each do |file|
        next if File.directory?(file)
        next unless file.end_with?(".md", ".erb", ".html")

        content = process_file(file)
        write_output(file, content)
      end
    end

    private

    def process_file(file)
      input = File.read(file)
      print "."
      case File.extname(file)
      when ".md"
        markdown_to_html(input)
      when ".erb"
        erb_to_html(input)
      when ".html"
        input
      end
    end

    def markdown_to_html(file)
      @markdown_renderer ||= Renderers::Markdown.new
      @markdown_renderer.render(file)
    end

    def erb_to_html(file)
      @erb_renderer ||= Renderers::Erb.new
      @erb_renderer.render(file)
    end

    def write_output(file, content)
      rel_path = file.sub(/^#{@src_dir}/, "")
      output_path = File.join(@dest_dir, rel_path)
      output_path.sub!(/\.(md|erb)$/, ".html")

      FileUtils.mkdir_p(File.dirname(output_path))
      File.write(output_path, content)
    end
  end
end
