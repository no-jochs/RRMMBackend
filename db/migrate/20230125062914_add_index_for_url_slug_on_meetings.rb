class AddIndexForUrlSlugOnMeetings < ActiveRecord::Migration[7.0]
  def change
    add_index :meetings, :url_slug, unique: true
  end
end
