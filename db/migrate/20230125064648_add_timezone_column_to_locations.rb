class AddTimezoneColumnToLocations < ActiveRecord::Migration[7.0]
  def change
    add_column :locations, :timezone, :string, default: 'UTC', null: false
  end
end
