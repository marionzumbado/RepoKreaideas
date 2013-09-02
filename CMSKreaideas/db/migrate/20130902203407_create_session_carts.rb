class CreateSessionCarts < ActiveRecord::Migration
  def change
    create_table :session_carts do |t|

      t.timestamps
    end
  end
end
