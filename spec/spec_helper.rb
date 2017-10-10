require 'bundler/setup'
require 'json2hcl'

def bin_file(ver,os,arch,path=nil)
  file = "json2hcl_v#{ver}_#{os}_#{arch}"
  file += '.exe' if os == 'windows'
  return File.expand_path(file, path) unless path.nil?
  return file
end

# RSpec.configure do |config|
#   # Enable flags like --only-failures and --next-failure
#   config.example_status_persistence_file_path = '.rspec_status'
#
#   # Disable RSpec exposing methods globally on `Module` and `main`
#   config.disable_monkey_patching!
#
#   config.expect_with :rspec do |c|
#     c.syntax = :expect
#   end
# end
