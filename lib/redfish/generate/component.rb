def generate_component(name)
  class_name = name.split('_').map(&:capitalize).join
  file_path = "lib/redfish/components/#{name}_component.rb"

  File.open(file_path, 'w') do |file|
    file.puts "class Redfish::#{class_name}Component < Redfish::Component"
    file.puts "  def initialize(context, *args)"
    file.puts "    super(context, *args)"
    file.puts "  end"
    file.puts ""
    file.puts "  private"
    file.puts ""
    file.puts "  def template"
    file.puts "    # Your template here"
    file.puts "  end"
    file.puts "end"
  end

  puts "#{class_name}Component generated at #{file_path}"
end

generate_component(ARGV[0])
