# frozen_string_literal: true

require "zeitwerk"

loader = Zeitwerk::Loader.new
loader.push_dir(File.join(__dir__, "..", "..", "lib"))
loader.push_dir(File.join(__dir__, "..", "..", "test"))
loader.setup
