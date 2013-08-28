class RemoveCountrycodeToRefineryproducts < ActiveRecord::Migration
  def up
	remove_column :kreaideasusers, :countrycode
  end

  def down
	remove_column :kreaideasusers, :countrycode
  end
end
