# This migration comes from refinery_albums (originally 1)
class CreateAlbumsAlbums < ActiveRecord::Migration

  def up
    create_table :refinery_albums do |t|
      t.string :name
      t.string :description
      t.integer :imagen_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-albums"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/albums/albums"})
    end

    drop_table :refinery_albums

  end

end
