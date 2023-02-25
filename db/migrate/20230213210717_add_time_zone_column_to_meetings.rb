class AddTimeZoneColumnToMeetings < ActiveRecord::Migration[7.0]
  def change
    add_column :meetings, :time_zone, :string
  end
end
