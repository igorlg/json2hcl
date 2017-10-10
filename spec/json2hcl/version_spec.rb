describe 'VERSION' do
  let(:v) { Json2hcl::VERSION }

  it 'has a version number' do
    expect(v).not_to be nil
  end

  it 'returns the version from VERSION file' do
    version_form_file = File.read(File.expand_path(File.join('..', '..', 'VERSION'), __dir__)).gsub(/v/, '').strip
    expect(v).to match(/#{version_form_file}/)
  end

  it 'doesnt start with "v"' do
    regex = /^v/
    expect(v).to_not match(regex)
    expect('v0.1.0').to match(regex) # Just double-checking the regex
  end

  it 'doesnt end in newline' do
    regex = /\n/
    nlstr = "
    "
    expect(v).to_not match(regex)
    expect(nlstr).to match(regex) # Just double-checking the regex
  end

  it 'is semantic versioned' do
    regex = /^\d+\.\d+\.\d+$/
    expect(v).to match(regex)
    expect('1.0').to_not match(regex)
  end
end
