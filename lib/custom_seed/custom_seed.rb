module CustomSeed

  module SeedGeneratorHelper


    def next_migration_number(path)
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    end

  end

  class Seed

    attr_accessor :timestamped_filename

    class << self

      def execute
        custom_seed = new
        if custom_seed.pending_seeds?
          pending_seeds = custom_seed.pending_seeds
          pending_seeds.each do |seed|
            puts "==== Executing #{ seed.filename }"
            seed.run
          end
        end
      end


      def get_all_versions
        CustomSeedMigration.all.map{|x| x.version.to_i }.sort
      end

      def pending_seeds?
        current_version < last_version
      end

      def pending_seeds
         all_seeds = custom_seed_paths(custom_seed_path)
         all_seeds.reject{|s| already_executed.include?(s.version)}
      end

      def last_version
        custom_seed_paths(custom_seed_path).last.try(:version) || 0
      end


      def current_version
        get_all_versions.max || 0
      end


      def already_executed
        @executed_versions||= Set.new(get_all_versions)
      end

      def custom_seed_path
        @custom_seed_path||=('db/custom_seeds')
      end


      def custom_seed_paths(path)
        path  = Array(path)
        files = Dir[*paths.map { |p| "#{p}/**/[0-9]*_*.rb" }]
        return [] if files.empty?
        seeds = files.map do |file|
          version, name, scope = file.scan(/([0-9]+)_([_a-z0-9]*)\.?([_a-z0-9]*)?\.rb\z/).first
          raise "Illegal seed" unless version
          version = version.to_i
          name = name.camelize
          SeedExecutor.new(name, version, file, scope)
        end
        seeds.sort_by(&:version)
      end


    end

             1

  end


  class SeedExecutor < Struct.new(:name, :version, :filename, :scope)

    def initialize(name, version, filename, scope)
      super
    end

    def run
       klass = name.constantize
       klass.send(:run)
       update_seeds_table
    end

    def update_seeds_table
      CustomSeedMigration.create(:version => self.version)
    end

  end
  
end


## Generate File Name With TimeStamp
#def generate_migration_filename
#  next_version = next_custom_seed_version(last_version)
#  @timestamped_filename = "#{ next_version }_#{ filename }.rb"
#end
#
#
#def copy
#  filepath = File.join(custom_seed_path, @timestamped_filename)
#end
#
#def  filename
#  @filename
#end
#
#
#private
#
#def prepare_directory
#  FileUtils.mkdir(custom_seed_path) unless File.exists?(custom_seed_path)
#end
#
#def next_custom_seed_version(number)
#  if ActiveRecord::Base.timestamped_migrations
#    [Time.now.utc.strftime("%Y%m%d%H%M%S"), "%.14d" % number].max
#  else
#    "%.3d" % number
#  end
#end
