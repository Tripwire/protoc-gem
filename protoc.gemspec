# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'protoc/version'

Gem::Specification.new do |spec|
  spec.name = 'protoc'
  spec.version = Protoc::VERSION

  spec.authors = 'Ben Jansen'
  spec.summary = 'Protoc binaries for Mac, Linux, and Windows'
  spec.description = <<EOF
This gem includes protoc, the protobuf compiler, binaries for Linux, Mac, and Windows. It installs a executable shim
called `protoc` that picks the right one to run on your platform. You can use this gem to ensure that you have a protoc
of the version you need. By using this gem, you will not need to manually install the right protoc on your hosts.

The pre-built linux protoc binaries are not compatible with all systems.  For this reason the protobuf source code is
included in this gem, and a new protoc binary is built upon gem installation when the pre-built one does not function.
EOF

  spec.homepage = 'https://github.com/Tripwire/protoc-gem'
  spec.license = 'BSD'

  spec.files = Dir['{bin,lib,ext}/**/*']
  spec.executables = spec.files.grep(%r{^bin}) { |f| File.basename(f) }
  spec.extensions = 'ext/protoc/extconf.rb'

  spec.add_development_dependency 'bundler', '~> 1.0'
  spec.add_development_dependency 'rake', '~> 11.0'
  spec.add_development_dependency 'rubygems-tasks', '~> 0.2'
  spec.add_runtime_dependency 'Platform', '~> 0.4'
end
