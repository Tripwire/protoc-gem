protoc
==================

This gem includes protoc, the protobuf compiler, binaries for Linux, Mac, Windows and AIX. It installs a executable shim
called `protoc` that picks the right one to run on your platform. You can use this gem to ensure that you have a protoc
of the version you need. By using this gem, you will not need to manually install the right protoc on your hosts.

The pre-built linux protoc binaries are not compatible with all systems.  For this reason the protobuf source code is
included in this gem, and a new protoc binary is built upon gem installation when the pre-built one does not function.

## Suggested Use

Put `protoc` in your Gemfile, with the version of protobuf that you need.

```
depends 'protoc', '2.6.1'
```

Run `protoc` using `bundle exec`. This ensures that you run `protoc` from this gem.

```
$ bundle exec protoc --version
libprotoc 2.6.1
```

## Binaries

The protoc binaries included in this gem  (with the exception of the AIX binary) came from the artifact
[available in Maven Central](http://search.maven.org/#artifactdetails%7Ccom.google.protobuf%7Cprotoc%7C2.6.1%7Cpom).

An AIX compatible binary has been added to the /bin folder, as the version of protobuf being used does not compile correctly when attempting to install the gem on AIX.  

A compilation on AIX fails as a result of the wrong header file being used when the AIX platform is detected.  The fix applied was as follows:

In the file: ```../protoc-gem/ext/protoc/protobuf/src/google/protobuf/stubs/atomicops.h```

```
// AIX
#elif defined(GOOGLE_PROTOBUF_OS_AIX)
#include <google/protobuf/stubs/atomicops_internals_power.h>
```

was changed to:

```
// AIX
#elif defined(GOOGLE_PROTOBUF_OS_AIX)
#include <google/protobuf/stubs/atomicops_internals_generic_gcc.h>
```


MD5 (protoc-2.6.1-aix-powerpc) = ```23945207b57158d5353a48a366b8fda4```
