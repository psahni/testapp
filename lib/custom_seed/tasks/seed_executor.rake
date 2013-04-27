

namespace :custom_seed do

  desc "This task runs the pending seeds generator through custom seed gem"

  task :execute => :environment do
     puts "==== Running pending migrations if any.."
     CustomSeed::Seed.execute
  end

end