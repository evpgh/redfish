require 'zeitwerk'
loader = Zeitwerk::Loader.new
loader.push_dir(File.join(__dir__, '..', '..', 'lib'))
loader.setup # ready!