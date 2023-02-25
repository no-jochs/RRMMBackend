class RenameVenueColumnOnMeetings < ActiveRecord::Migration[7.0]
  def change
    rename_column :meetings, :venue, :format
  end
end
