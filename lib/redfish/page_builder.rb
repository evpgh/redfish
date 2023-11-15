# frozen_string_literal: true

require "fileutils"
require "erb"

module Redfish
  class PageBuilder
    def initialize(src_dir: "src", dest_dir: "dist")
      @src_dir = src_dir
      @dest_dir = dest_dir
      @renderer = Render.new
    end

    def build_site
      Dir.glob(File.join(@src_dir, "**", "*")).each do |file|
        next if File.directory?(file)
        next unless file.end_with?(".md", ".erb")

        content = process_file(file)
        write_output(file, content)
      end
    end

    private

    def process_file(file)
      print "."
      case File.extname(file)
      when ".md"
        markdown_to_html(file)
      when ".erb"
        erb_to_html(file)
      end
    end

    def markdown_to_html(file)
      @renderer.markdown_to_html_file(file)
    end

    def erb_to_html(file)
      input = File.read(file)
      @renderer.render_erb(input)
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
