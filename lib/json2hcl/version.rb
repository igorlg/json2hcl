module Json2hcl
  VERSION = File.read(File.expand_path(File.join('..', '..', 'VERSION'), __dir__)).sub(/v/, '').strip
end
