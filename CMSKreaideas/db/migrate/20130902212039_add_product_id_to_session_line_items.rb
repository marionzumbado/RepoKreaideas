class AddProductIdToSessionLineItems < ActiveRecord::Migration
  def change
    add_column :session_line_items, :product_id, :int
  end
end
