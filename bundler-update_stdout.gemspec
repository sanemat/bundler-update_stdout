# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bundler/update_stdout/version'

Gem::Specification.new do |spec|
  spec.name          = 'bundler-update_stdout'
  spec.version       = Bundler::UpdateStdout::VERSION
  spec.authors       = ['sanemat']
  spec.email         = ['o.gata.ken@gmail.com']
  spec.description   = %q{Print a result of bundle update Gemfile.lock.}
  spec.summary       = %q{You can detect diff between updated Gemfile.lock and old one!}
  spec.homepage      = 'https://github.com/sanemat/bundler-update_stdout'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '>= 1.4.0.pre.2'
  spec.add_development_dependency 'rake'
end
