class RenameCountryIdentifierColumnOnLocations < ActiveRecord::Migration[7.0]
  def change
    rename_column :locations, :country_identifier, :country
  end
end
