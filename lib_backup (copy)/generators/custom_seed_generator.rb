#class CustomSeed::CustomSeedGenerator < Rails::Generators::NamedBase
#  source_root File.expand_path('../templates', __FILE__)
#end

require 'custom_seed/custom_seed'
require 'custom_seed/custom_seed_migration'


  module Generators

    class  CustomSeedGenerator < Rails::Generators::NamedBase


      def create_custom_seed_file
        CustomSeed::Seed.new(file_name).generate_migration_filename        
      end

    end

  end
