# scripts/generate_component.rb
def generate_component(name)
  class_name = name.split('_').map(&:capitalize).join
  file_path = "lib/hyder/components/#{name}_component.rb"

  File.open(file_path, 'w') do |file|
    file.puts "class Hyder::#{class_name}Component < Hyder::Component"
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
