# frozen_string_literal: true

require "fileutils"
require "erb"
require "pry"

module Redfish
  class PageBuilder
    def initialize(src_dir: "src", dest_dir: "dist", template: "template.html.erb")
      @src_dir = src_dir
      @dest_dir = dest_dir
      @template = template.is_a?(ERB) ? template : load_template(template)
    end

    def build_site
      Dir.glob(File.join(@src_dir, "**", "*")).each do |file|
        next if File.directory?(file)
        next unless file.end_with?(".md", ".erb", ".html")

        content = process_file(file)
        write_output(file, content)
        print "." # Progress indicator
      end
    end

    private

    def process_file(file)
      input = File.read(file)
      case File.extname(file)
      when ".md"
        markdown_to_html(input)
      when ".erb"
        erb_to_html(input)
      when ".html"
        input
      end
    end

    def markdown_to_html(input)
      @markdown_renderer ||= Renderers::Markdown.new(@template)
      @markdown_renderer.render(input)
    end

    def erb_to_html(input)
      @erb_renderer ||= Renderers::Erb.new(@template)
      @erb_renderer.render(input)
    end

    def write_output(file, content)
      rel_path = file.sub(/^#{@src_dir}/, "")
      output_path = File.join(@dest_dir, rel_path)
      output_path.sub!(/\.(md|erb)$/, ".html")

      FileUtils.mkdir_p(File.dirname(output_path))
      File.write(output_path, content)
    end

    def load_template(file)
      ERB.new(File.read(file))
    end
  end
end
