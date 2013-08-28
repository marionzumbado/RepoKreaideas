class Deleteattachimagetoproduct < ActiveRecord::Migration
   def self.up
      remove_column :refinery_products, :attach_file_name
      remove_column :refinery_products, :attach_content_type
      remove_column :refinery_products, :attach_file_size 
      remove_column :refinery_products, :attach_updated_at   
    end
  
   def self.down
     add_column :refinery_products, :attach_file_name
     add_column :refinery_products, :attach_content_type
     add_column :refinery_products, :attach_file_size
     add_column :refinery_products, :attach_updated_at
   end
end
