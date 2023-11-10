require 'redcarpet'

module Hyder
  class Render
    def markdown_renderer
      @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    end

    def markdown_to_html(markdown_content)
      markdown_renderer.render(markdown_content)
    end

    def markdown_to_html_file(markdown_file_path)
      markdown_to_html(File.read(markdown_file_path))
    end

    def render_erb(template, binding)
      ERB.new(template).result(binding)
    end
  end
end
