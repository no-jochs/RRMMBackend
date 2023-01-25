class AddIndexForUrlSlugOnLocations < ActiveRecord::Migration[7.0]
  def change
    add_index :locations, :url_slug, unique: true
  end
end
