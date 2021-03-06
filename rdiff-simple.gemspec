# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rdiff_simple/version'

Gem::Specification.new do |spec|
  spec.name             = "rdiff-simple"
  spec.version          = RdiffSimple::VERSION
  spec.authors          = ["Ryan Hansen"]
  spec.email            = ["ketiko@gmail.com"]
  spec.description      = %q{A simple wrapper around rdiff-backup}
  spec.summary          = %q{A wrapper around the rdiff-backup executable}
  spec.homepage         = "http://github.com/ketiko/rdiff-simple"
  spec.license          = "MIT"

  spec.files            = `git ls-files`.split($/)
  spec.executables      = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files       = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths    = ["lib"]

  spec.extra_rdoc_files = [ "LICENSE.txt", "README.md" ]
  spec.rdoc_options     = [ "--charset=UTF-8" ]

  spec.add_dependency "activesupport"

  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 2.0.0"
  spec.add_development_dependency "coveralls"
end
