# -*- encoding: utf-8 -*-
#lib = File.expand_path('../lib', __FILE__)
#$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
$:.push File.expand_path("../lib", __FILE__)
require 'infusion/version'

Gem::Specification.new do |spec|
  spec.name          = "infusion"
  spec.version       = Infusion::VERSION
  spec.authors       = ["Jagdish.Barabari"]
  spec.email         = ["jagdish.barabari@example.com"]
  spec.description   = %q{A custom Ruby wrapper for the Infusionsoft API }
  spec.summary       = %q{Methods includes add, update contact to IS and campaign setup}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
