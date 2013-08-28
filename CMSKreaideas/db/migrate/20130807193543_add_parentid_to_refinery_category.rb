class AddParentidToRefineryCategory < ActiveRecord::Migration
  def change
    add_column :refinery_categories, :parent_id, :int
  end
end
