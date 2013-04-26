module CustomSeed

  class Seed
    
    
    def initialize(file_name)
      @filename = file_name
    end
    
    # Generate File Name With TimeStamp
    def generate_migration_filename
    end


    def get_all_versions
      CustomSeedMigration.all.map(&:version)
    end

    def current_version
      get_all_versions.max
    end

    def last_version
      #migrations(migrations_paths).last.try(:version)||0
    end

    def custom_seed_path
      @custom_seed_path||=['db/custom_seeds']
    end

    def custom_seed_paths(paths)
      files = Dir[*paths.map { |p| "#{p}/**/[0-9]*_*.rb" }]
       seeds = files.map do |file|
        version, name, scope = file.scan(/([0-9]+)_([_a-z0-9]*)\.?([_a-z0-9]*)?\.rb\z/).first

        raise "Illegal seed" unless version

        version = version.to_i
        name = name.camelize

        SeedProxy.new(name, version, file, scope)
       end

        seeds.sort_by(&:version)
    end



  end

  class SeedProxy < Struct.new(:name, :version, :filename, :scope)

    def initialize(name, version, filename, scope)
      super
      @migration = nil
    end


  end
  
end
