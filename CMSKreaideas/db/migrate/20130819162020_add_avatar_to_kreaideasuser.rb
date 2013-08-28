class AddAvatarToKreaideasuser < ActiveRecord::Migration
   def self.up
    add_attachment :kreaideasusers, :avatar
  end

  def self.down
    remove_attachment :kreaideasusers, :avatar
  end
end
