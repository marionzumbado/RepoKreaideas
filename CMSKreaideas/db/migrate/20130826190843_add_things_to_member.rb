class AddThingsToMember < ActiveRecord::Migration
   def change
	add_column :members, :name, :string
	add_column :members, :phone, :integer
	add_column :members, :address, :string
	add_column :members, :points, :integer
  end
end
