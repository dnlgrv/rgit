# frozen_string_literal: true

require_relative "lib/rgit/version"

Gem::Specification.new do |spec|
  spec.name = "rgit"
  spec.authors = ["Daniel Grieve"]
  spec.email = ["dnlgrv@hey.com"]
  spec.license = "MIT"
  spec.summary = "Ruby implementation of Git"
  spec.version = Rgit::VERSION

  spec.required_ruby_version = ">= 2.6.0"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
