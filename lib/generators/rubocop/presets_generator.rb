require "rails/generators"

module Rubocop

  module Generators

    # Generator to copy preset files into project
    #
    # rubocop:disable Rails/Output
    class PresetsGenerator < Rails::Generators::Base

      def create_initializer
        source = File.expand_path("../../../config/*.yml", __dir__)
        destination = "config/rubocop"

        FileUtils.mkdir_p(destination) unless File.directory?(destination)
        FileUtils.cp_r(Dir.glob(source), destination)

        # TODO: : puts is wrong.  that outputs this when you run rails g (list rails generators).  There must be a better alternative

        puts "Rubocop configs copied to /config/rubocop !!"
        puts "Verify the following at the top of your .rubocop.yml:"
        puts ""
        puts "inherit_from:"
        puts "  - config/rubocop/default.yml"
        puts "  - config/rubocop/rails.yml"
        puts "  - config/rubocop/rake.yml"
        puts "  - config/rubocop/rspec.yml"
        puts ""
        puts "inherit_mode:"
        puts "  merge:"
        puts "    - Exclude"
      end

    end
    # rubocop:enable Rails/Output

  end

end
