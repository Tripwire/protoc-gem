# coding: utf-8

winspec = Gem::Specification.load('protoc.gemspec').dup
winspec.files = Dir['{bin,lib}/**/*']
winspec.extensions = nil
winspec.platform = "universal-mingw32"
winspec
