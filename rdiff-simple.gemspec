# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rdiff_simple/version'

Gem::Specification.new do |spec|
  spec.name             = "rdiff-simple"
  spec.version          = RdiffSimple::VERSION
  spec.authors          = ["Ryan Hansen"]
  spec.email            = ["ketiko@gmail.com"]
  spec.description      = %q{A simplier way to backup with rdiff-backup}
  spec.summary          = %q{Simplified backups with rdiff-backup}
  spec.homepage         = "http://github.com/ketiko/rdiff-simple"
  spec.license          = "MIT"

  spec.files            = `git ls-files`.split($/)
  spec.executables      = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files       = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths    = ["lib"]

  spec.extra_rdoc_files = [ "LICENSE.txt", "README.md" ]
  spec.rdoc_options     = [ "--charset=UTF-8" ]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rspec", "~> 2"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "coveralls"

  spec.add_dependency "thor"
end
