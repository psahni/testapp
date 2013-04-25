#class CustomSeed::InstallGenerator < Rails::Generators::NamedBase
#  source_root File.expand_path('../templates', __FILE__)
#
#
#end


require 'custom_seed/custom_seed_migration'

module CustomSeed

  module Generators

    class InstallGenerator < Rails::Generators::Base

      source_root File.expand_path("../../templates", __FILE__)
      desc "Creates a Devise initializer and copy locale files to your application."

      #create custom_seed table
      def initialize(args = [], options = {}, config = {})
        super
        puts "="*5 +  "> Creating custom_seeds table "
        CustomSeedMigration.create_table
      end

    end

  end
end