class RemoveStartTimeHourAndStartTimeMinuteColumnsAndChangeStartDateTypeOnMeetings < ActiveRecord::Migration[7.0]
  def up
    remove_column :meetings, :start_time_hour
    remove_column :meetings, :start_time_minute
    change_column :meetings, :start_date, :datetime, null: false
  end

  def down
    add_column :meetings, :start_time_hour, :integer, null: false, default: 12
    add_column :meetings, :start_time_minute, :integer, null: false, default: 0
    change_column :meetings, :start_date, :date, null: false, default: -> { 'CURRENT_DATE' }
  end
end
