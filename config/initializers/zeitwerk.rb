# frozen_string_literal: true

require "zeitwerk"

loader = Zeitwerk::Loader.for_gem
loader.push_dir(File.join(__dir__, "..", "..", "lib"))
#loader.push_dir(File.join(Dir.pwd, "src")) if Dir.exist?(File.join(__dir__, "src"))
#loader.push_dir(File.join(__dir__, "..", "..", "test")) if Dir.exist?(File.join(__dir__, "..", "..", "test"))
loader.setup
