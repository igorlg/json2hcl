module Json2hcl
  VERSION = File.read(File.expand_path(File.join('..', '..', 'VERSION'), __dir__)).sub(/v/, '')
  # VERSION = File.read(File.join(File.expand_path(__dir__), '..', '..', 'VERSION')).sub(/v/, '')
end
