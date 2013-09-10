class Deletecreateinrnotification < ActiveRecord::Migration
  def up
	remove_column :payment_notifications, :create
  end

  def down
	add_column :payment_notifications, :create
  end
end
