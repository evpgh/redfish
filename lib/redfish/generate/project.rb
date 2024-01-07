# frozen_string_literal: true

require "fileutils"

module Redfish
  module Generate
    class Project
      def initialize(name)
        @name = name || "new_redfish_site"
      end

      def generate
        create_directories
        create_default_files
      end

      private

      def create_directories
        base_dir = "#{Dir.pwd}/#{@name}"
        directories = ["src", "src/pages", "src/components", "src/assets", "src/assets/styles", "src/assets/scripts",
                       "src/assets/images", "src/pages/blog", "src/templates"]

        directories.each do |dir|
          FileUtils.mkdir_p(File.join(base_dir, dir))
        end
      end

      def create_default_files
        base_dir = "#{Dir.pwd}/#{@name}"

        # Create a default index page
        File.write(File.join(base_dir, "src/pages/index.md"), "# Welcome to Redfish!")

        # Create a default template
        File.write(File.join(base_dir, "src/templates/pages.erb"), template_text)

        # Create a sample blog post
        File.write(File.join(base_dir, "src/pages/blog/2023-01-01-hello-world.md"),
                   "# Hello World\nThis is my first blog post using Redfish.")

        # Add more default file creations here...
      end

      def template_text
"<!DOCTYPE html>
<html>
  <head>
    <title>Redfish</title>
  </head>
  <body>
    <%= content %>
  </body>
</html>"
      end
    end
  end
end
