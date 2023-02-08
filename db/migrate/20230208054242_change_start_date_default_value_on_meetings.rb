class ChangeStartDateDefaultValueOnMeetings < ActiveRecord::Migration[7.0]
  def up
    change_column_default :meetings, :start_date, nil
  end

  def down
    change_column_default :meetings, :start_date, -> { 'CURRENT_DATE' }
  end
end
