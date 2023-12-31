# frozen_string_literal: true

require_relative "lib/redfish/version"

Gem::Specification.new do |spec|
  spec.name = "redfish"
  spec.version = Redfish::VERSION
  spec.authors = ["Evgeni Pavlov"]
  spec.email = ["evgeni@hey.com"]

  spec.summary = "Static site generator"
  spec.description = "Simple static site generator inspired by Jekyll"
  spec.homepage = "http://www.noneyet.com"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "http://www.noneyet.com"
  spec.metadata["changelog_uri"] = "http://www.noneyet.com"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = "bin"
  spec.executables << "rf"
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "erb"
  spec.add_dependency "redcarpet"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata["rubygems_mfa_required"] = "true"
end
