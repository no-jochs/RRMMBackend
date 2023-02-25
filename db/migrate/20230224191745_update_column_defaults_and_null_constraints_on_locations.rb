class UpdateColumnDefaultsAndNullConstraintsOnLocations < ActiveRecord::Migration[7.0]
  def change
    change_column_null :locations, :country, true
    change_column_null :locations, :time_zone, true
    add_index :locations, :name, unique: true
    add_index :meetings, :name, unique: true
  end
end
