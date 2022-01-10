This gem holds default Rubocop configuration, forked from [makandra-rubocop](https://github.com/makandra/makandra-rubocop).

Note that we each version is locked to a specific Rubocop version, as Rubocop's syntax changes regularly. This gem will be versioned in a manner to match Rubocop's minor version.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rubocop-presets', git: 'https://github.com/ddankel/rubocop-presets'
```

And then execute:

    $ bundle install

Finally copy the config files into the local project using the provided generator

    $ rails g rubocop:presets

## Usage

Add a `.rubocop.yml` to your project with the following contents:

**For Ruby**

```yaml
inherit_from:
  - config/rubocop/default.yml
  - config/rubocop/rails.yml
  - config/rubocop/rake.yml
  - config/rubocop/rspec.yml

inherit_mode:
  merge:
    - Exclude
```

Any per-project rules can then be defined in the `.rubocop.yml`:

```yaml
inherit_from:
  - config/rubocop/default.yml
  - config/rubocop/rails.yml
  - config/rubocop/rake.yml
  - config/rubocop/rspec.yml

inherit_mode:
  merge:
    - Exclude

AllCops:
  Exclude:
    - "lib/assets/**/*"

Layout/MultilineArrayLineBreaks:
  Enabled: true
```

### Executing Rubocop on demand

Run Rubocop via `bundle exec rubocop` from your project directory. For an initial run it might also useful to use the auto-correct option (`bundle exec rubocop --auto-correct`) and carefully check all changes.

### Integrating Rubocop into your test suite

You can add an RSpec test that runs rubocop automatically and confirms that there are no offenses by adding `spec/rubocop_spec.rb` to your project with the following code.

```ruby
require 'rubocop-presets/support/rubocop_spec'
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
