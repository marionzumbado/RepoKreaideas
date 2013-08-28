class DeleteGabageinProductimages < ActiveRecord::Migration
  def self.up
	remove_column :productimages, :imagen_file_name
	remove_column :productimages, :imagen_content_type
	remove_column :productimages, :imagen_updated_at
	remove_column :productimages, :imagen_file_size
  end

  def self.down
	add_column :productimages, :imagen_file_name
	add_column :productimages, :imagen_content_type
	add_column :productimages, :imagen_updated_at
	add_column :productimages, :imagen_file_size
  end
end
