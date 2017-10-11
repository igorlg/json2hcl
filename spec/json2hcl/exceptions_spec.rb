require 'json2hcl/exceptions'

RSpec.shared_examples 'default_exception_tests' do |subject,default_msg|
  it 'should extend StandardError class' do
    expect(subject < StandardError).to be_truthy
  end

  it 'should be raisable' do
    expect { raise subject }.to raise_error subject
  end

  it "should raise message '#{default_msg}' by default" do
    expect { raise described_class }.to raise_error subject, default_msg
  end

  it 'should allow only zero or one parameter' do
    aggregate_failures "inputs for #{subject.class}" do
      expect { subject.new }.to_not raise_error
      expect { subject.new('p1') }.to_not raise_error
      expect { subject.new('p1', 'p2') }.to raise_error ArgumentError
    end
  end
end

describe 'Custom Exceptions' do
  describe Json2hcl::InvalidHCLError do
    include_examples 'default_exception_tests', described_class, 'Invalid HCL'

    it 'should allow custom messages on raise' do
      msg = 'Custom Message'
      expect { raise described_class, msg }.to raise_error Json2hcl::InvalidHCLError, msg
    end

    # it 'should allow only zero or one parameter' do
    #   aggregate_failures 'inputs for InvalidHCLError' do
    #     expect { described_class.new }.to_not raise_error
    #     expect { described_class.new('p1') }.to_not raise_error
    #     expect { described_class.new('p1', 'p2') }.to raise_error ArgumentError
    #   end
    # end
  end

  describe Json2hcl::InvalidJSONError do
    include_examples 'default_exception_tests', described_class, 'Invalid JSON'

    it 'should allow custom messages on raise' do
      msg = 'Custom Message'
      expect { raise described_class, msg }.to raise_error Json2hcl::InvalidJSONError, msg
    end

    # it 'should allow only zero or one parameter' do
    #   aggregate_failures 'inputs for InvalidJSONError' do
    #     expect { described_class.new }.to_not raise_error
    #     expect { described_class.new('p1') }.to_not raise_error
    #     expect { described_class.new('p1', 'p2') }.to raise_error ArgumentError
    #   end
    # end
  end

  describe Json2hcl::InvalidFileError do
    include_examples 'default_exception_tests', described_class, 'Invalid path to file'

    it 'should allow custom messages on raise' do
      msg = 'Custom Message'
      expect { raise described_class, msg }.to raise_error Json2hcl::InvalidFileError, msg
    end

    # it 'should allow only zero or one parameter' do
    #   aggregate_failures 'inputs for InvalidFileError' do
    #     expect { described_class.new }.to_not raise_error
    #     expect { described_class.new('p1') }.to_not raise_error
    #     expect { described_class.new('p1', 'p2') }.to raise_error ArgumentError
    #   end
    # end
  end

  describe Json2hcl::CommandExecutionError do
    include_examples 'default_exception_tests', described_class, 'Command returned a non-zero status'

    it 'should allow custom messages on raise' do
      msg = 'Custom Message'
      expect { raise described_class, msg }.to raise_error Json2hcl::CommandExecutionError, msg
    end

    # it 'should allow only zero or one parameter' do
    #   expect { described_class.new }.to_not raise_error
    #   expect { described_class.new('p1') }.to_not raise_error
    #   expect { described_class.new('p1', 'p2') }.to raise_error ArgumentError
    # end
  end
end
