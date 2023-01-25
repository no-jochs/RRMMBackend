class RemoveStartTimeColumnAndAddStartTimeHourAndStartTimeMinuteColumnsToMeetings < ActiveRecord::Migration[7.0]
  def change
    remove_column :meetings, :start_time, :time, null: false
    add_column :meetings, :start_time_hour, :integer, null: false, default: 12
    add_column :meetings, :start_time_minute, :integer, null: false, default: 0
  end
end
