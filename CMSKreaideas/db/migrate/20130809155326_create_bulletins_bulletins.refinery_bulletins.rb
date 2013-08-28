# This migration comes from refinery_bulletins (originally 1)
class CreateBulletinsBulletins < ActiveRecord::Migration

  def up
    create_table :refinery_bulletins do |t|
      t.string :title
      t.string :description
      t.date :publicationday
      t.integer :user_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-bulletins"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/bulletins/bulletins"})
    end

    drop_table :refinery_bulletins

  end

end
