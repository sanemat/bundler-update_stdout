# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bundler/update_stdout/version'

Gem::Specification.new do |spec|
  spec.name          = "bundler-update_stdout"
  spec.version       = Bundler::UpdateStdout::VERSION
  spec.authors       = ["sanemat"]
  spec.email         = ["o.gata.ken@gmail.com"]
  spec.description   = %q{TODO: Write a gem description}
  spec.summary       = %q{TODO: Write a gem summary}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 1.4.0.pre.2"
  spec.add_development_dependency "rake"
end
