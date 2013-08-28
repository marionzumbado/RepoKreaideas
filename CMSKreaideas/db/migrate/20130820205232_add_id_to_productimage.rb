class AddIdToProductimage < ActiveRecord::Migration
  def change
    add_column :productimages, :product_id, :integer
  end
end
