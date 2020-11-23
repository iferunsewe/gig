require_relative 'lib/gig/version'

Gem::Specification.new do |spec|
  spec.name          = "gig2"
  spec.version       = Gig::VERSION
  spec.authors       = ["Ife Runsewe"]
  spec.email         = ["iferunsewe@gmail.com"]

  spec.summary       = "This repo allows you to download repository owner's images given a search term"
  spec.description   = "This repo allows you to download repository owner's images given a search term"
  spec.homepage      = "http://www.ifesgig.co.uk"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/iferunsewe/gig"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = ["gig"]
  spec.require_paths = ["lib"]
end
