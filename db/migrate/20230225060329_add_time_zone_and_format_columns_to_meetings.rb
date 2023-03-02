class AddTimeZoneAndFormatColumnsToMeetings < ActiveRecord::Migration[7.0]
  def change
    add_column :meetings, :time_zone, :string
    add_column :meetings, :format, :integer, default: 0, null: false
  end
end
