#class CustomSeed::InstallGenerator < Rails::Generators::NamedBase
#end

# rails generate custom_seed:install

require 'custom_seed/custom_seed_migration'

module CustomSeed

  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Add a capability to generate custom seeds to your application"

      def initialize(args = [], options = {}, config = {})
        super
        puts "="*5 +  "> Creating custom_seeds table "
        CustomSeedMigration.create_table
      end

    end

  end
end