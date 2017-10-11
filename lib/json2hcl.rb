require 'json2hcl/version'
require 'json2hcl/os'

require 'tempfile'

module Json2hcl
  def self.binfile
    file = "json2hcl_v#{VERSION}_#{OS.os}_#{OS.arch}"
    file += '.exe' if OS.os == 'windows'
    File.expand_path(File.join('json2hcl', 'bin', file), __dir__)
  end

  def self.to_json(data)
    # TODO: REFACTOR THIS!
    if File.file?(data)
      jsonstr = `#{binfile} -reverse 2>&1 < #{data}`
      raise Json2hcl::InvalidHCLError unless $?.exitstatus == 0
    else
      f = ::Tempfile.new
      f.write(data)
      f.close
      jsonstr = `#{binfile} -reverse 2>&1 < #{f.path}`
      f.unlink
      raise Json2hcl::InvalidHCLError unless $?.exitstatus == 0
    end

    return jsonstr
  end
end
