# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'we/interstellar/version'

Gem::Specification.new do |spec|
  spec.name          = "we-interstellar-gem"
  spec.version       = We::Interstellar::VERSION
  spec.authors       = ["WeWork Engineering"]
  spec.email         = ["engineering@wework.com"]

  spec.summary       = "Wraps up the Interstellar service HTTP calls, so you don't have to."
  spec.description   = "Let this Ruby gem handle the barebones interactions, giving you some nice Ruby object and obvious excpeptions."
  spec.homepage      = "https://github.com/WeConnect/we-interstellar-gem"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://push.fury.io/wework-dev/"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  
  spec.add_dependency "faraday", ">= 0.8.0", "< 1.0"
  spec.add_dependency "faraday_middleware"
  spec.add_dependency "we-call", "~> 0.4.1"

  spec.add_development_dependency "appraisal"
  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "rspec", "~> 3.5"
end
