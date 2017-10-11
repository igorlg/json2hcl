require 'os'

module Json2hcl
  module OS
    def self.os
      return 'linux'    if ::OS.linux?
      return 'darwin'   if ::OS.mac?
      return 'windows'  if ::OS.windows?
    end

    def self.arch
      return '386'    if ::OS.bits == 32
      return 'amd64'  if ::OS.bits == 64
    end
  end
end
