class AddTypeToRefineryProducts < ActiveRecord::Migration
 def self.up
   add_column :refinery_products, :type, :boolean
 end
 def self.down
  remove_column :refinery_products, :type, :boolean
 end
end
