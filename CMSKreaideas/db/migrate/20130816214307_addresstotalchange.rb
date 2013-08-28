class Addresstotalchange < ActiveRecord::Migration
  def up
	rename_column :kreaideasusers, :addresslevel1_id, :country_id
  end

  def down
	rename_column :kreaideasusers, :addresslevel1_id, :country_id
  end
end
