require 'platform'
require_relative '../../lib/protoc/version'

PLATFORM_TO_PROTOC_ARCH = {:x86 => :x86_32, :x86_64 => :x86_64}

# Work around for lack of x86_64 support in Platform 0.4.0, which is the
# latest in rubygems.org. https://github.com/mmower/platform/issues/3
def platform_arch
  if Platform::ARCH == :unknown && RUBY_PLATFORM =~ /x86_64/
    :x86_64
  else
    Platform::ARCH
  end
end

OS = case Platform::OS
       when :win32
         'windows'
       when :unix
         case Platform::IMPL
           when :macosx
             'osx'
           when :linux
             'linux'
           else
             Platform::IMPL.to_s
         end
       else
         Platform::OS.to_s
     end

HERE = File.expand_path(File.dirname(__FILE__))
binpath = File.expand_path(File.join(HERE, '..', '..', 'bin'))
protoc_path = File.join(
  binpath, "protoc-#{Protoc::PROTOBUF_VERSION}-#{OS}-#{PLATFORM_TO_PROTOC_ARCH[platform_arch]}.exe"
)
`#{protoc_path} --version`
if $? != 0 && OS != 'windows'
  Dir.chdir(HERE) do
    template = File.read(File.join(HERE, 'Makefile.in'))
    template.gsub!('@PROTOBUF_VERSION@', Protoc::PROTOBUF_VERSION)
    template.gsub!('@PROTOC_BINARY_PATH@', protoc_path)
    File.write(File.join(HERE, 'Makefile'), template)
  end
end
