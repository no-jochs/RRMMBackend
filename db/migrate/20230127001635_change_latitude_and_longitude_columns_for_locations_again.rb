class ChangeLatitudeAndLongitudeColumnsForLocationsAgain < ActiveRecord::Migration[7.0]
  def change
    change_column :locations, :latitude, :decimal, precision: 15, scale: 12
    change_column :locations, :longitude, :decimal, precision: 15, scale: 12
  end
end
