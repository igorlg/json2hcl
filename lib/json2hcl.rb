require 'json2hcl/version'
require 'json2hcl/os'

module Json2hcl
  extend ::Json2hcl::OS

  def json2hcl
    file = "json2hcl_v#{VERSION}_#{os}_#{arch}"
    file += '.exe' if os == 'windows'
    File.expand_path(File.join('json2hcl', 'bin', file), __dir__)
  end
end
