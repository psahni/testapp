#class CustomSeed::CustomSeedGenerator < Rails::Generators::NamedBase
#  source_root File.expand_path('../templates', __FILE__)
#end

require 'custom_seed/custom_seed_migration'

module CustomSeed

  module Generators

    class  CustomSeedGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('../templates', __FILE__)

      def create_custom_seed_file
        set_local_assigns!
      end

    end

  end
end