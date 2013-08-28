class Deleteimageidfromproducts < ActiveRecord::Migration
  def up
	remove_column :refinery_products ,:image_id
  end

  def down
	add_column :refinery_products ,:image_id
  end
end
