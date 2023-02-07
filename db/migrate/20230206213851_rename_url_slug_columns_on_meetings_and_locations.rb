class RenameUrlSlugColumnsOnMeetingsAndLocations < ActiveRecord::Migration[7.0]
  def change
    rename_column :meetings, :url_slug, :slug
    rename_column :locations, :url_slug, :slug
  end
end
