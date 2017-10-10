require 'json2hcl/version'

require 'os'

module Json2hcl
  # def json2hcl
  #   bin = "json2hcl_v#{VERSION}_#{os}_#{arch}"
  #   File.expand_path(File.join('json2hcl', bin), __dir__)
  # end

  # private

  def os
    return 'linux'    if OS.linux?
    return 'darwin'   if OS.mac?
    return 'windows'  if OS.windows?
  end

  def arch
    return '386'    if OS.bits == 32
    return 'amd64'  if OS.bits == 64
  end
end
