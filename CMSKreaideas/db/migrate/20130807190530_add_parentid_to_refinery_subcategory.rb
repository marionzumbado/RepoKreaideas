class AddParentidToRefinerySubcategory < ActiveRecord::Migration
  def change
    add_column :refinery_subcategories, :parent_id, :int
  end
end
