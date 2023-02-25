class RemoveVenueTypeColumnFromLocations < ActiveRecord::Migration[7.0]
  def change
    remove_column :locations, :venue_type, :integer, default: 0, null: false
  end
end
