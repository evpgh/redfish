# frozen_string_literal: true

require "fileutils"
require "erb"
require "pry"

module Redfish
  class PageBuilder
    def initialize(src_dir: "src", dest_dir: "dist", template: "src/templates/pages.erb")
      @src_dir = src_dir
      @dest_dir = dest_dir
      @template_path = template
      @template = load_template(@template_path)
    end

    def build_site
      files = Dir.glob(File.join(@src_dir, "**", "*.{md,erb,html}")).reject { |f| f.include?("templates") }
      files.each do |input_file|
        content = process_file(input_file)
        write_output(input_file, content)
      end
    end

    private

    def process_file(file)
      input = File.read(file)
      pick_template(file)
      case File.extname(file)
      when ".md"
        markdown_to_html(input)
      when ".erb"
        erb_to_html(input)
      when ".html"
        input
      end
    end

    def pick_template(file)
      dir_template = File.join("src/templates/", File.dirname(file), ".erb")
      template_path = if File.exist?(dir_template)
                        dir_template
                      else
                        "#{@src_dir}/templates/pages.erb"
                      end
      @template = load_template(template_path) unless @template_path == template_path
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
      output_path.sub!("pages/", "home/")
      output_path.sub!(/\.(md|erb)$/, ".html")

      FileUtils.mkdir_p(File.dirname(output_path))
      File.write(output_path, content)
    end

    def load_template(file)
      ERB.new(File.read(file))
    end
  end
end
