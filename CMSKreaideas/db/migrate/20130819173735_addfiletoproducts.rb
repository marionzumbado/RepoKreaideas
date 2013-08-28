class Addfiletoproducts < ActiveRecord::Migration
   def self.up
      add_column :refinery_products, :attach_file_name,    :string
      add_column :refinery_products, :attach_content_type, :string
      add_column :refinery_products, :attach_file_size,    :integer
      add_column :refinery_products, :attach_updated_at,   :datetime
    end
  
   def self.down
     remove_column :refinery_products, :attach_file_name
     remove_column :refinery_products, :attach_content_type
     remove_column :refinery_products, :attach_file_size
     remov_column :refinery_products, :attach_updated_at
   end
end
