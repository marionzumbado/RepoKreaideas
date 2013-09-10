class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :member_id
      t.date :purshased_at

      t.timestamps
    end
  end
end
