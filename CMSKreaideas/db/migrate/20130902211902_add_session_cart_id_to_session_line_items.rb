class AddSessionCartIdToSessionLineItems < ActiveRecord::Migration
  def change
    add_column :session_line_items, :session_cart_id, :int
  end
end
