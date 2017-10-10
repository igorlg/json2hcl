# require 'digest'
require 'json2hcl/version'
require 'spec_helper'

RSpec.shared_examples 'bin_file' do |version,os,arch,sha256|
  describe "file #{bin_file(version, os, arch)}" do
    before do
      @path     = File.expand_path(File.join('..', '..', 'lib', 'json2hcl', 'bin'), __dir__)
      @file     = bin_file(version, os, arch, @path)
    end

    it 'should exist' do
      expect(File.exist?(@file)).to eq true
    end

    it 'should be executable' do
      expect(File.executable?(@file)).to eq true
    end

    it "should have SHA256 hash = #{sha256}" do
      expect(Digest::SHA256.file(@file).hexdigest).to eq sha256
    end
  end
end

describe 'Binary json2hcl' do
  include_examples 'bin_file', '0.0.6', 'darwin',  '386',    '4294338d4f16a3f66013364d75ca49e9641a57722c9d93f6fd8d59ae71d1b232' # json2hcl_v0.0.6_darwin_386
  include_examples 'bin_file', '0.0.6', 'darwin',  'amd64',  '547dfd077647a2fdd2258cb72f752c1422ca299f9c0b27501bcc133fac62451d' # json2hcl_v0.0.6_darwin_amd64
  include_examples 'bin_file', '0.0.6', 'linux',   '386',    '0c988eee018e239a2360b7067508d7b196fd5e4a946ea7ac8b5e19c8e99d2f30' # json2hcl_v0.0.6_linux_386
  include_examples 'bin_file', '0.0.6', 'linux',   'amd64',  'd124ed13f3538c465fcab19e6015d311d3cd56f7dc2db7609b6e72fec666482d' # json2hcl_v0.0.6_linux_amd64
  include_examples 'bin_file', '0.0.6', 'windows', '386',    '2e157a10e4bd6b31f9f3664302facef10140a57a54a4bc776fad7d23e49a5691' # json2hcl_v0.0.6_windows_386.exe
  include_examples 'bin_file', '0.0.6', 'windows', 'amd64',  '33657d19f974c3e98b7df32eb77d01858498eaa81c12314dbaaba94650cc77ae' # json2hcl_v0.0.6_windows_amd64.exe
end
