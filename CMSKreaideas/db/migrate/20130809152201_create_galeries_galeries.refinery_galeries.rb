# This migration comes from refinery_galeries (originally 1)
class CreateGaleriesGaleries < ActiveRecord::Migration

  def up
    create_table :refinery_galeries do |t|
      t.string :name
      t.string :description
      t.integer :imagen_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-galeries"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/galeries/galeries"})
    end

    drop_table :refinery_galeries

  end

end
