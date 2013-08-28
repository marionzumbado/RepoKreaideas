class AddCountrycodeToKreaideasuser < ActiveRecord::Migration
  def change
    add_column :kreaideasusers, :countrycode, :string
  end
end
