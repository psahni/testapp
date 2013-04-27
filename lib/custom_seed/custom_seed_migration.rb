require 'active_record/base'

module CustomSeed

  class CustomSeedMigration < ActiveRecord::Base

    def self.table_name
      'custom_seeds'
    end


    def self.index_name
      'custom_seeds_version_index'
    end


    def self.create_table
      unless connection.table_exists?(table_name)
        connection.create_table(table_name, id: false) do |table|
         table.column :version, :string, null: false
        end
        connection.add_index table_name, :version, unique: true, name: index_name
      end
    end


    def self.drop_table
      if connection.table_exists?(table_name)
         connection.remove_index table_name, name: index_name
         connection.drop_table(table_name)
      end
    end


    private

    def connection
      ActiveRecord::Base.connection
    end
  end



end