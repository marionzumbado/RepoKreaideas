class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :member_id
      t.date :OrderDate

      t.timestamps
    end
  end
end
