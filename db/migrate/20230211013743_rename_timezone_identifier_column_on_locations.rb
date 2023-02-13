class RenameTimezoneIdentifierColumnOnLocations < ActiveRecord::Migration[7.0]
  def change
    rename_column :locations, :timezone_identifier, :time_zone
  end
end
