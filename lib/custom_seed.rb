
require 'rails'
require 'custom_seed/custom_seed'
require 'custom_seed/custom_seed_migration'


module CustomSeed

  mattr_accessor :version
  self.version = '1.0'

  require 'custom_seed/railtie' if defined?(Rails)

end

