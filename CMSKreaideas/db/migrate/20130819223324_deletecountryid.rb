class Deletecountryid < ActiveRecord::Migration
  def up
	remove_column :kreaideasusers ,:country_id
  end

  def down
	add_column :kreaideasusers ,:country_id
  end
end
