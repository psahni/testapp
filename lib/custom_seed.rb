
module CustomSeed

  extend self

  mattr_accessor :version
  self.version = '1.0'

end

require 'rails'
require 'custom_seed/custom_seed'
require 'custom_seed/custom_seed_migration'

