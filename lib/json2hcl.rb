require 'json2hcl/version'

module Json2hcl
  def json2hcl
    file = "json2hcl_v#{VERSION}_#{os}_#{arch}"
    file += '.exe' if OS.os == 'windows'
    File.expand_path(File.join('json2hcl', 'bin', file), __dir__)
  end
end
