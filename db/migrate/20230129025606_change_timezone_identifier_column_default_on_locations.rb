class ChangeTimezoneIdentifierColumnDefaultOnLocations < ActiveRecord::Migration[7.0]
  def change
    change_column_default :locations, :timezone_identifier, nil
  end
end
