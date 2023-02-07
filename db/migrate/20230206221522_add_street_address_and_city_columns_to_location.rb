class AddStreetAddressAndCityColumnsToLocation < ActiveRecord::Migration[7.0]
  def change
    add_column :locations, :street_address_1, :string
    add_column :locations, :street_address_2, :string
    add_column :locations, :city, :string
    remove_column :locations, :formatted_address, :string
  end
end
