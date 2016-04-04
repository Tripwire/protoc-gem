# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'protoc/version'

Gem::Specification.new do |spec|
  spec.name = 'protoc'
  spec.version = Protoc::VERSION

  spec.authors = 'Ben Jansen'
  spec.summary = 'Protoc binaries for Mac, Linux, and Windows'
  spec.description = IO.read("#{File.dirname(__FILE__)}/README.md")
  spec.homepage = 'https://github.com/Tripwire/protoc-gem'
  spec.license = 'BSD'

  spec.files = Dir['{bin,lib}/**/*']
  spec.executables = spec.files.grep(%r{^bin}) { |f| File.basename(f) }

  spec.add_development_dependency 'bundler', '~> 1.0'
  spec.add_development_dependency 'rake', '~> 11.0'
  spec.add_development_dependency 'rubygems-tasks', '~> 0.2'
  spec.add_runtime_dependency 'Platform', '~> 0.4'
end
