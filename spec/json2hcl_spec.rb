require 'json2hcl'
require 'json2hcl/os'

describe Json2hcl do
  before do
    oshelper  = Class.new { extend ::Json2hcl::OS }
    @path     = File.expand_path(File.join('..', 'lib', 'json2hcl', 'bin'), __dir__)
    @os       = oshelper.os
    @arch     = oshelper.arch
    @binfile  = bin_file(::Json2hcl::VERSION, '', '', @path)
  end

  let(:subject) { Class.new { extend ::Json2hcl } }

  describe '.json2hcl' do
    it 'should return the full path to the json2hcl bin file' do
      expect(subject.json2hcl).to eq @binfile
    end
  end
end
