require 'json2hcl'
require 'json2hcl/os'
require 'json2hcl/exceptions'

require 'json'
require 'rspec/json_expectations'

describe Json2hcl do
  before do
    @path     = File.expand_path(File.join('..', 'lib', 'json2hcl', 'bin'), __dir__)
    @os       = ::Json2hcl::OS.os
    @arch     = ::Json2hcl::OS.arch
    @version  = ::Json2hcl::VERSION
    @file     = bin_file(@version, @os, @arch, @path)

    @subject  = ::Json2hcl
  end

  describe '.binfile' do
    it 'should return the full path to the json2hcl bin file' do
      f = @subject.binfile

      expect(f).to eq @file
      expect(Pathname.new(f).absolute?).to eq true
    end

    it 'takes no arguments' do
      aggregate_failures 'inputs for json2hcl' do
        expect { @subject.binfile }.to_not raise_error
        expect { @subject.binfile('') }.to raise_error ArgumentError
        expect { @subject.binfile('', '') }.to raise_error ArgumentError
      end
    end
  end

  describe '.to_json' do
    let(:valid_hcl_file)    { File.expand_path(File.join('assets', 'hcl', 'full.hcl'), __dir__) }
    let(:valid_hcl_string)  { File.read(valid_hcl_file) }
    let(:valid_json_file)   { File.expand_path(File.join('assets', 'json', 'full.json'), __dir__) }
    let(:valid_json_string) { File.read(valid_json_file) }

    let(:invalid_hcl_file)    { File.expand_path(File.join('assets', 'hcl', 'invalid.hcl'), __dir__) }
    let(:invalid_hcl_string)  { File.read(invalid_hcl_file) }
    let(:invalid_json_file)   { File.expand_path(File.join('assets', 'json', 'invalid.json'), __dir__) }
    let(:invalid_json_string) { File.read(invalid_json_file) }

    it 'takes only one argument' do
      aggregate_failures 'inputs for to_json' do
        expect { @subject.to_json }.to raise_error ArgumentError
        expect { @subject.to_json('') }.to_not raise_error
        expect { @subject.to_json('', '') }.to raise_error ArgumentError
      end
    end

    it 'parses a HCL string into valid JSON' do
      aggregate_failures 'HCL string into JSON for to_json' do
        hclstr = @subject.to_json(valid_hcl_string)
        expect { JSON.parse(hclstr) }.to_not raise_error
        expect(JSON.load(hclstr)).to eq JSON.load(valid_json_string)
      end
    end

    it 'parses a HCL File into valid JSON' do
      hclstr = @subject.to_json(valid_hcl_file)
      expect { JSON.parse(hclstr) }.to_not raise_error
      expect(JSON.load(hclstr)).to eq JSON.load(valid_json_string)
    end

    it 'raises InvalidHCLError on invalid HCL String' do
      aggregate_failures 'InvalidHCLError on String for to_json' do
        expect { @subject.to_json(invalid_hcl_string) }.to raise_error Json2hcl::InvalidHCLError
        expect { @subject.to_json(valid_hcl_string) }.to_not raise_error
      end
    end

    it 'raises InvalidHCLError on invalid HCL File' do
      aggregate_failures 'InvalidHCLError on File for to_json' do
        expect { @subject.to_json(invalid_hcl_file) }.to raise_error Json2hcl::InvalidHCLError
        expect { @subject.to_json(valid_hcl_file) }.to_not raise_error
      end
    end
  end
end
