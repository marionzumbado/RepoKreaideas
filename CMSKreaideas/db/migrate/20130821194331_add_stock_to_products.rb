class AddStockToProducts < ActiveRecord::Migration
  def change
    add_column :refinery_products, :stock, :integer
  end
end
