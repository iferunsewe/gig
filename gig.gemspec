require_relative 'lib/gig/version'

Gem::Specification.new do |spec|
  spec.name          = "gig"
  spec.version       = Gig::VERSION
  spec.authors       = ["Ife Runsewe"]
  spec.email         = ["iferunsewe@gmail.com"]

  spec.summary       = "This repo allows you to download repository owner's images given a search term"
  spec.description   = "This repo allows you to download repository owner's images given a search term"
  spec.homepage      = "http://www.bbc.co.uk"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "http://www.bbc.co.uk"
  spec.metadata["changelog_uri"] = "http://www.bbc.co.uk"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end