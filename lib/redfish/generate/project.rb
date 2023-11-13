require 'fileutils'

module Redfish
  module Generate
    class Project
      def generate
        create_directories
        create_default_files
      end

      private

      def create_directories
        base_dir = "#{Dir.pwd}/new_redfish_site"
        directories = ['src/pages', 'src/components', 'src/assets', 'src/assets/styles', 'src/assets/scripts', 'src/assets/images', 'src/pages/blog']

        directories.each do |dir|
          FileUtils.mkdir_p(File.join(base_dir, dir))
        end
      end

      def create_default_files
        base_dir = "#{Dir.pwd}/new_redfish_site"

        # Create a default index page
        File.write(File.join(base_dir, 'src/pages/index.erb'), "<h1>Welcome to Redfish!</h1>")

        # Create a sample blog post
        File.write(File.join(base_dir, 'src/pages/blog/2023-01-01-hello-world.md'), "# Hello World\nThis is my first blog post using Redfish.")

        # Add more default file creations here...
      end
    end
  end
end
