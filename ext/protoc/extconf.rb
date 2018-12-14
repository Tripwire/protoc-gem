require 'platform'
require_relative '../../lib/protoc/version'

PLATFORM_TO_PROTOC_ARCH = {:x86 => :x86_32, :x86_64 => :x86_64, :powerpc => :powerpc}

OS = case Platform::OS
       when :win32
         'windows'
       when :unix
         case Platform::IMPL
           when :macosx
             'osx'
           when :linux
             'linux'
           when :aix
             'aix'
           else
             Platform::IMPL.to_s
         end
       else
         Platform::OS.to_s
     end

HERE = File.expand_path(File.dirname(__FILE__))
binpath = File.expand_path(File.join(HERE, '..', '..', 'bin'))
case Platform::OS 
  when :win32
    protoc_path = File.join(
      binpath, "protoc-#{Protoc::PROTOBUF_VERSION}-#{OS}-#{PLATFORM_TO_PROTOC_ARCH[Platform::ARCH]}.exe"
    )
  else
    protoc_path = File.join(
      binpath, "protoc-#{Protoc::PROTOBUF_VERSION}-#{OS}-#{PLATFORM_TO_PROTOC_ARCH[Platform::ARCH]}"
    )
end

`#{protoc_path} --version`
if $? != 0 && OS != 'windows'
  Dir.chdir(HERE) do
    template = File.read(File.join(HERE, 'Makefile.in'))
    template.gsub!('@PROTOC_BINARY_PATH@', protoc_path)
    File.write(File.join(HERE, 'Makefile'), template)
  end
end
