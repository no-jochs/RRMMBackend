class AddPlaceIdToLocations < ActiveRecord::Migration[7.0]
  def change
    add_column :locations, :place_id, :integer, unique: true
  end
end
