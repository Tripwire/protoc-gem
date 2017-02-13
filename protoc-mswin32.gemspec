# coding: utf-8

winspec = Gem::Specification.load('protoc.gemspec').dup
winspec.extensions = nil
winspec.platform = "universal-mswin32"
winspec
