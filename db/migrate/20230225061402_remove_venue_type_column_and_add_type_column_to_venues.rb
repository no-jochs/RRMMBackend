class RemoveVenueTypeColumnAndAddTypeColumnToVenues < ActiveRecord::Migration[7.0]
  def up
    change_column_null :venues, :country, true
    change_column_null :venues, :time_zone, true
    remove_column :venues, :venue_type
    add_column :venues, :type, :string
    Venue.reset_column_information
    VirtualVenue.record
    Venue.where(type: nil).update_all(type: 'PhysicalVenue')
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
