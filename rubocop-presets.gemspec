lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rubocop_presets/version"

Gem::Specification.new do |spec|
  spec.name = "rubocop-presets"
  spec.version = RubocopPresets::VERSION
  spec.required_ruby_version = ">= 2.7.0"
  spec.authors = ["Dave Dankel"]
  spec.email = ["ddankel@gmail.com"]

  spec.summary = "Default Rubocop configuration"
  spec.description = "A set of default Rubocop settings to use across projects."
  spec.homepage = "https://github.com/ddankel/rubocop-presets"
  spec.license = "MIT"

  spec.metadata = { "rubygems_mfa_required" => "true" }

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rubocop", ">= 1.43", "< 1.52"
  spec.add_dependency "rubocop-performance", ">= 1.15", "< 1.18"
  spec.add_dependency "rubocop-rails", ">= 2.17", "< 2.20"
  spec.add_dependency "rubocop-rake", "~> 0.6.0"
  spec.add_dependency "rubocop-rspec", ">= 2.17", "< 2.21"

  spec.post_install_message = '
    rubocop-presets Post-installation tasks:

    - run rails g rubocop:presets to copy config files to config/rubocop/*
    - Add the following to the top of your .rubocop.yml file:

        inherit_from:
          - config/rubocop/default.yml
          - config/rubocop/rails.yml
          - config/rubocop/rake.yml
          - config/rubocop/rspec.yml

        inherit_mode:
          merge:
            - Exclude
    '
end
