class AddImageToProductimages < ActiveRecord::Migration
  def self.up
    add_attachment :productimages, :imagen
  end

  def self.down
    remove_attachment :productimages, :imagen
  end
end
