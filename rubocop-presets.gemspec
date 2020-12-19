lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubocop_presets/version'

Gem::Specification.new do |spec|
  spec.name = 'rubocop-presets'
  spec.version = RubocopPresets::VERSION
  spec.required_ruby_version = '>= 2.3.0'
  spec.authors = ['Dave Dankel']
  spec.email = ['ddankel@gmail.com']

  spec.summary = "Default Rubocop configuration"
  spec.description = 'A set of default Rubocop settings to use across projects.'
  spec.homepage = 'https://bitbucket.org/ddankel/rubocop_presets'
  spec.license = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r(^exe/)) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rubocop', '~> 1.6.0'
  spec.add_dependency 'rubocop-performance', '1.9.0'
  spec.add_dependency 'rubocop-rails', '~> 2.9.0'
  spec.add_dependency 'rubocop-rspec', '~> 2.1.0'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 12.3'
end
