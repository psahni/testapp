#class CustomSeed::CustomSeedGenerator < Rails::Generators::NamedBase
#  source_root File.expand_path('../templates', __FILE__)
#end

require 'custom_seed/custom_seed'
require 'custom_seed/custom_seed_migration'


module CustomSeed

  module Generators

    class  CustomSeedGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('../templates', __FILE__)
      include Rails::Generators::Migration
      extend CustomSeed::SeedGeneratorHelper

      def create_custom_seed_file
        migration_template 'custom_seed.rb', "db/custom_seeds/#{ file_name }.rb"
      end


    end

  end
end