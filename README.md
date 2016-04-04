protoc
==================

This gem includes protoc binaries for Linux, Mac, and Windows. It installs a executable shim called `protoc` that picks
the right one to run on your platform. You can use this gem to ensure that you have a protoc of the version you need on
a system.

## Suggested Use

Put `protoc` in your Gemfile, with the version of protobuf that you need.

```
depends 'protoc', '2.6.1'
```

Run `protoc` using `bundle exec`.

```
$ bundle exec protoc --version
libprotoc 2.6.1
```

## Binaries

The protoc binaries included in this gem came from the artifact
[available in Maven Central](http://search.maven.org/#artifactdetails%7Ccom.google.protobuf%7Cprotoc%7C2.6.1%7Cpom).
