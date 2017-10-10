require 'os'
require 'json2hcl'

describe Json2hcl do
  context 'OS = mac, Arch = 64bits' do
    before do
      allow(::OS).to receive(:mac?).and_return(true)
      allow(::OS).to receive(:linux?).and_return(false)
      allow(::OS).to receive(:windows?).and_return(false)
      allow(::OS).to receive(:bits).and_return(64)
    end

    let(:subject)   { Class.new { extend ::Json2hcl } }
    let(:gem_root)  { File.expand_path('..', __dir__) }
    let(:bin_root)  { File.join(gem_root, 'lib', 'json2hcl', 'bin') }
    let(:version)   { Json2hcl::VERSION }

    it '.os should return "darwin"' do
      expect(subject.os).to eq 'darwin'
    end

    it '.arch should return "amd64"' do
      expect(subject.arch).to eq 'amd64'
    end

    # it ".json2hcl should return full path to '<gem_root>/lib/bin/json2hcl_v#{version}_darwin_amd64'" do
    it ".json2hcl should return full path to json2hcl binary" do
      expect(subject.json2hcl).to eq "#{bin_root}/json2hcl_v#{version}_darwin_amd64"
    end
  end

  context 'OS = mac, Arch = 32bits' do
    before do
      allow(::OS).to receive(:mac?).and_return(true)
      allow(::OS).to receive(:linux?).and_return(false)
      allow(::OS).to receive(:windows?).and_return(false)
      allow(::OS).to receive(:bits).and_return(32)
    end

    let(:subject) { Class.new { extend ::Json2hcl } }

    it '.os should return "darwin"' do
      expect(subject.os).to eq 'darwin'
    end

    it '.arch should return "amd64"' do
      expect(subject.arch).to eq '386'
    end
  end

  context 'OS = linux, Arch = 64bits' do
    before do
      allow(::OS).to receive(:mac?).and_return(false)
      allow(::OS).to receive(:linux?).and_return(true)
      allow(::OS).to receive(:windows?).and_return(false)
      allow(::OS).to receive(:bits).and_return(64)
    end

    let(:subject) { Class.new { extend ::Json2hcl } }

    it '.os should return "linux"' do
      expect(subject.os).to eq 'linux'
    end

    it '.arch should return "amd64"' do
      expect(subject.arch).to eq 'amd64'
    end
  end

  context 'OS = linux, Arch = 32bits' do
    before do
      allow(::OS).to receive(:mac?).and_return(false)
      allow(::OS).to receive(:linux?).and_return(true)
      allow(::OS).to receive(:windows?).and_return(false)
      allow(::OS).to receive(:bits).and_return(32)
    end

    let(:subject) { Class.new { extend ::Json2hcl } }

    it '.os should return "linux"' do
      expect(subject.os).to eq 'linux'
    end

    it '.arch should return "386"' do
      expect(subject.arch).to eq '386'
    end
  end

  context 'OS = windows, Arch = 64bits' do
    before do
      allow(::OS).to receive(:mac?).and_return(false)
      allow(::OS).to receive(:linux?).and_return(false)
      allow(::OS).to receive(:windows?).and_return(true)
      allow(::OS).to receive(:bits).and_return(64)
    end

    let(:subject) { Class.new { extend ::Json2hcl } }

    it '.os should return "windows"' do
      expect(subject.os).to eq 'windows'
    end

    it '.arch should return "amd64"' do
      expect(subject.arch).to eq 'amd64'
    end
  end

  context 'OS = windows, Arch = 32bits' do
    before do
      allow(::OS).to receive(:mac?).and_return(false)
      allow(::OS).to receive(:linux?).and_return(false)
      allow(::OS).to receive(:windows?).and_return(true)
      allow(::OS).to receive(:bits).and_return(32)
    end

    let(:subject) { Class.new { extend ::Json2hcl } }

    it '.os should return "windows"' do
      expect(subject.os).to eq 'windows'
    end

    it '.arch should return "386"' do
      expect(subject.arch).to eq '386'
    end
  end
end
