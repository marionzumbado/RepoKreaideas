class Deletetypeandpathfromproducts < ActiveRecord::Migration
  def up
	remove_column :refinery_products ,:downloadpath
	remove_column :refinery_products ,:producttype
  end

  def down
	add_column :refinery_products ,:downloadpath
	add_column :refinery_products ,:producttype
  end
end
