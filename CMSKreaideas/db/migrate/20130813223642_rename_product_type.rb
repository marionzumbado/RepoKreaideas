class RenameProductType < ActiveRecord::Migration
  def up
  	rename_column :refinery_products, :type, :producttype
  end

  def down
  	rename_column :refinery_products, :type, :producttype
  end
end
