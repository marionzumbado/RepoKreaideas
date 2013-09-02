class CreateSessionLineItems < ActiveRecord::Migration
  def change
    create_table :session_line_items do |t|

      t.timestamps
    end
  end
end
