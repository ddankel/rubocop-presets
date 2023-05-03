This gem holds default Rubocop configuration, forked from [makandra-rubocop](https://github.com/makandra/makandra-rubocop).

Note that we each version is locked to a specific Rubocop version, as Rubocop's syntax changes regularly. This gem will be versioned in a manner to match Rubocop's minor version.

## Installation

Add this line to your application's `Gemfile`:

```ruby
gem 'rubocop-presets', git: 'https://github.com/<this_repo_url_path>'
```

And then execute:

    $ bundle install

## Usage

Add a `.rubocop.yml` to your project with the following contents:

**For Ruby**

```yaml
inherit_gem:
  rubocop-presets: config/default.yml
```

**For Rails**

```yaml
inherit_gem:
  rubocop-presets:
    - config/default.yml
    - config/ext/rails.yml
```

**For RSpec**

```yaml
inherit_gem:
  rubocop-presets:
    - config/default.yml
    - config/ext/rspec.yml
```

Any per-project rules can then be defined in the `.rubocop.yml`:

```yaml
inherit_gem:
  rubocop-presets:
    - config/default.yml
    - config/ext/rails.yml

AllCops:
  Exclude:
    - "lib/assets/**/*"

Layout/MultilineArrayLineBreaks:
  Enabled: true
```

It also might be desired to set `inherit_mode`, which specifies which configuration keys that have
array values should be merged together instead of overriding the inherited value:

```yaml
inherit_mode:
  merge:
    - Exclude
```

> **NOTE**: For instructions on including the rubocop configs directly in your project instead of inheriting from this gem, see the [alternative integration doc](readme/alternative_integration.md).

### Executing Rubocop on demand

Run Rubocop via `bundle exec rubocop` from your project directory. For an initial run it might also useful to use the auto-correct option (`bundle exec rubocop --auto-correct`) and carefully check all changes.

### Integrating Rubocop into your test suite

You can add an RSpec test that runs rubocop automatically and confirms that there are no offenses by adding `spec/rubocop_spec.rb` to your project with the following code.

```ruby
require 'rubocop-presets/support/rubocop_spec'
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
