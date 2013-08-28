class AddAttachPaperclip < ActiveRecord::Migration
   def self.up
      remove_column :refinery_products, :attach_file_name,    :string
      remove_column :refinery_products, :attach_content_type, :string
      remove_column :refinery_products, :attach_file_size,    :integer
      remove_column :refinery_products, :attach_updated_at,   :datetime
    end
  
   def self.down
     add_column :refinery_products, :attach_file_name
     add_column :refinery_products, :attach_content_type
     add_column :refinery_products, :attach_file_size
     add_column :refinery_products, :attach_updated_at
   end
end
