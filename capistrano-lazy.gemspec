# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/lazy'

Gem::Specification.new do |spec|
  spec.name          = 'capistrano-lazy'
  spec.version       = Capistrano::Lazy::VERSION
  spec.authors       = ['Stas SUȘCOV']
  spec.email         = ['stas@net.utcluj.ro']
  spec.summary       = %q{Capistrano tasks for lazy.}
  spec.description   = %q{Some capistrano tasks for trivial things.}
  spec.homepage      = 'https://github.com/stas/capistrano-lazy'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'capistrano', '>= 3.0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
end
