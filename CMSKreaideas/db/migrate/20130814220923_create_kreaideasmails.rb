class CreateKreaideasmails < ActiveRecord::Migration
  def change
    create_table :kreaideasmails do |t|
      t.string :name
      t.string :email
      t.string :message

      t.timestamps
    end
  end
end
