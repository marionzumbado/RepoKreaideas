class AddToSessionLineItem < ActiveRecord::Migration
  def up
    add_column :session_line_items, :quantity, :int
  end

  def down
  end
end
