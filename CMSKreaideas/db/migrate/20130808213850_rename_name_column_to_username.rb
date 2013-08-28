class RenameNameColumnToUsername < ActiveRecord::Migration
  def up
  	rename_column :refinery_products, :subcategoria_id, :subcategory_id
  end

  def down
  	rename_column :refinery_products, :subcategoria_id, :subcategory_id
  end
end
