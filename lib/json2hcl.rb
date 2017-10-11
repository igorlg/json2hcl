require 'json2hcl/version'
require 'json2hcl/os'

require 'tempfile'
require 'open3'

module Json2hcl
  def self.binfile
    file = "json2hcl_v#{VERSION}_#{OS.os}_#{OS.arch}"
    file += '.exe' if OS.os == 'windows'
    File.expand_path(File.join('json2hcl', 'bin', file), __dir__)
  end

  def self.to_json(data)
    if File.file?(data)
      begin
        jsonstr = cmd(data, true)
      rescue CommandExecutionError
        raise InvalidHCLError
      end
    else
      # TODO: REFACTOR THIS!
      f = ::Tempfile.new
      f.write(data)
      f.close

      begin
        jsonstr = cmd(f.path, true)
      rescue CommandExecutionError
        raise InvalidHCLError
      ensure
        f.unlink
      end
    end

    return jsonstr
  end

  def self.to_hcl(data)
    if File.file?(data)
      begin
        hclstr = cmd(data, false)
      rescue CommandExecutionError
        raise InvalidJSONError
      end
    else
      f = ::Tempfile.new
      f.write(data)
      f.close

      begin
        hclstr = cmd(f.path, false)
      rescue CommandExecutionError
        raise InvalidJSONError
      ensure
        f.unlink
      end
    end

    return hclstr
  end

  def self.cmd(data, reverse=false)
    raise ArgumentError     unless [true, false].include? reverse
    raise InvalidFileError  unless Pathname.new(data).absolute?

    cmd = binfile
    cmd += ' -reverse' if reverse
    cmd += ' 2>&1'
    cmd += " < #{data}"

    stdout = `#{cmd}`
    # puts cmd
    raise CommandExecutionError unless $?.exitstatus == 0

    return stdout
  end
end
