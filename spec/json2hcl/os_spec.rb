require 'json2hcl/os'
require 'os'

RSpec.shared_examples 'json2hcl_os' do |os,arch,stubs|
  describe "OS: #{os}, Arch: #{arch}" do
    before do
      allow(::OS).to receive(:mac?).and_return(stubs[:mac])
      allow(::OS).to receive(:linux?).and_return(stubs[:linux])
      allow(::OS).to receive(:windows?).and_return(stubs[:windows])
      allow(::OS).to receive(:bits).and_return(stubs[:bits])
    end

    let(:subject)   { Class.new { extend ::Json2hcl::OS } }
    let(:bin_path)  { File.expand_path(File.join('..', '..', 'lib', 'json2hcl', 'bin'), __dir__) }
    let(:vesion)    { Json2hcl::VERSION }

    it '.os should return "darwin"' do
      expect(subject.os).to eq os
    end

    it '.arch should return "amd64"' do
      expect(subject.arch).to eq arch
    end
  end
end

def make_stubs(m=true, l=true, w=true, b=64)
  {
    mac:      m,
    linux:    l,
    windows:  w,
    bits:     b,
  }
end

describe Json2hcl::OS do
  include_examples 'json2hcl_os', 'darwin',   'amd64',  make_stubs(true, false, false, 64)
  include_examples 'json2hcl_os', 'darwin',   '386',    make_stubs(true, false, false, 32)
  include_examples 'json2hcl_os', 'linux',    'amd64',  make_stubs(false, true, false, 64)
  include_examples 'json2hcl_os', 'linux',    '386',    make_stubs(false, true, false, 32)
  include_examples 'json2hcl_os', 'windows',  'amd64',  make_stubs(false, false, true, 64)
  include_examples 'json2hcl_os', 'windows',  '386',    make_stubs(false, false, true, 32)
end
