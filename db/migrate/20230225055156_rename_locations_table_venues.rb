class RenameLocationsTableVenues < ActiveRecord::Migration[7.0]
  def change
    rename_table :locations, :venues
    rename_column :meetings, :location_id, :venue_id
  end
end
