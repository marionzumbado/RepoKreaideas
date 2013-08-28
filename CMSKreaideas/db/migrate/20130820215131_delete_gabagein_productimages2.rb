class DeleteGabageinProductimages2 < ActiveRecord::Migration
  def self.up
	remove_column :productimages, :name
  end

  def self.down
	add_column :productimages, :name
  end
end
