[< Back](../README.md)

To include config files directly in your project, use the provided generator to copy the gem's config files:

    $ rails g rubocop:presets

This generator will copy the config files to `<project>/config/rubocop/*.yml`. This generator **must** be re-run any time the rubocop-preset gem is updated to insure the most up to date default configurations are pulled into your project in this maner.

Once these configs are in place, reference them in your `.rubocop.yml` as follows:

```yaml
inherit_from:
  - config/rubocop/default.yml
  - config/rubocop/rails.yml
  - config/rubocop/rake.yml
  - config/rubocop/rspec.yml

inherit_mode:
  merge:
    - Exclude

# Provide any additional configs as usual:
AllCops:
  Exclude:
    - "lib/assets/**/*"

Layout/MultilineArrayLineBreaks:
  Enabled: true
```
