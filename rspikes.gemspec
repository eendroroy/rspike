# frozen_string_literal: true
# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspikes/version'

Gem::Specification.new do |spec|
  spec.name          = 'rspikes'
  spec.version       = Rspikes::VERSION
  spec.authors       = ['indrajit']
  spec.email         = ['eendroroy@gmail.com']
  spec.summary       = 'rspikes'
  spec.description   = 'A tool to display sparkline anywhere.'
  spec.homepage      = 'http://rubygems.org/gems/rspikes'
  spec.license       = 'MIT'
  unless spec.respond_to?(:metadata)
    raise 'RubyGems >= 2.0 is required to protect against public gem pushes.'
  end
  spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.0.0'

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
