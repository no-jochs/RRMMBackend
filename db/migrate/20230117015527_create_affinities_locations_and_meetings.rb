class CreateAffinitiesLocationsAndMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.text :notes
      t.decimal :latitude
      t.decimal :longitude
      t.string :formatted_address
      t.string :country, null: false
      t.string :state_providence
      t.string :postal_code
      t.string :url_slug, null: false
      t.integer :venue_type, null: false, default: 0

      t.timestamps
    end
  end
end
