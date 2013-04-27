require 'custom_seed'

module CustomSeed

  class Railtie < Rails::Railtie

    railtie_name :custom_seed

    rake_tasks do
      load 'custom_seed/tasks/seed_executor.rake'
    end

  end

end