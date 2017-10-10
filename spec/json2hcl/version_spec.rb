describe 'VERSION' do
  it 'has a version number' do
    expect(Json2hcl::VERSION).not_to be nil
  end

  it 'returns the version from VERSION file' do
    version_form_file = File.read(File.expand_path(File.join('..', '..', 'VERSION'), __dir__)).gsub(/v/, '')
    expect(Json2hcl::VERSION).to match(/#{version_form_file}/)
  end
end
