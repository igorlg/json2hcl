lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'json2hcl/version'

Gem::Specification.new do |spec|
  spec.name          = 'json2hcl'
  spec.version       = Json2hcl::VERSION
  spec.authors       = [ 'Igor Gentil' ]
  spec.email         = [ 'igor@devops.cool' ]

  spec.summary       = 'Gem wrapper for Json2Hcl'
  spec.description   = 'Gem wrapper for Json2Hcl (https://github.com/kvz/json2hcl). It follows the releases of that project'
  spec.homepage      = 'https://github.com/igorlg/json2hcl'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = [ 'lib' ]

  spec.add_dependency 'os', '~> 1.0'

  spec.add_development_dependency 'bundler',  '~> 1.16.a'
  spec.add_development_dependency 'rake',     '~> 12.0'
  spec.add_development_dependency 'rspec',    '~> 3.0'
  spec.add_development_dependency 'pry',      '~> 0.10'
end
