# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'core/version'

Gem::Specification.new do |spec|
  spec.name          = 'core'
  spec.version       = Core::VERSION.dup
  spec.authors       = ['Andrew Holland']
  spec.email         = ['andyholland1991@aol.com']
  spec.summary       = 'Core'
  spec.description   = spec.summary
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = ['lib/core.rb']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'rom', '0.6.0'
  spec.add_runtime_dependency 'activesupport', '~> 4.0.4'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake', '~> 10.3'
  spec.add_development_dependency 'rspec-core', '~> 3.2'
  spec.add_development_dependency 'rspec-mocks', '~> 3.2'
  spec.add_development_dependency 'rspec-expectations', '~> 3.2'
end
