class CreateLineOrders < ActiveRecord::Migration
  def change
    create_table :line_orders do |t|
      t.integer :product_id
      t.integer :quantity
      t.float :subtotal
      t.float :total

      t.timestamps
    end
  end
end
