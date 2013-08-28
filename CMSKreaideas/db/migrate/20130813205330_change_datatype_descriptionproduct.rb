class ChangeDatatypeDescriptionproduct < ActiveRecord::Migration
     def change
        change_column :refinery_products, :description, :text
     end
end
