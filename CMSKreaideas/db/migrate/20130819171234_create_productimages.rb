class CreateProductimages < ActiveRecord::Migration
  def change
    create_table :productimages do |t|

      t.timestamps
    end
  end
end
