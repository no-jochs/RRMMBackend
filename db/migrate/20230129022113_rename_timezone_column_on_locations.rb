class RenameTimezoneColumnOnLocations < ActiveRecord::Migration[7.0]
  def change
    rename_column :locations, :timezone, :timezone_identifier
  end
end
