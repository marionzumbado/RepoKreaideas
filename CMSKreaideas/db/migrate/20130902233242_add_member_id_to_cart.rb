class AddMemberIdToCart < ActiveRecord::Migration
  def change
    add_column :carts, :member_id, :int
  end
end
