class AddDefaultQuantitysessioncart < ActiveRecord::Migration
  def up
	change_column :session_line_items, :quantity, :int, :default => 1
  end

  def down
  end
end
