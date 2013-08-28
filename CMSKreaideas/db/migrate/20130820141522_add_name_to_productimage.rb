class AddNameToProductimage < ActiveRecord::Migration
  def change
    add_column :productimages, :name, :string
  end
end
