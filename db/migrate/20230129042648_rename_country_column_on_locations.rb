class RenameCountryColumnOnLocations < ActiveRecord::Migration[7.0]
  def change
    rename_column :locations, :country, :country_identifier
  end
end
