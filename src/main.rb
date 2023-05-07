require 'ffi'

path = 'target/debug/libffi_sample.dylib'

unless File.exist?(path)
  puts "Library file does not exist: #{path}"
  exit
end

module MyLib
  extend FFI::Library
  ffi_lib 'target/debug/libffi_sample.dylib'
  attach_function :addition, [:int, :int], :int
end

result = MyLib.addition(2, 3)
puts result
