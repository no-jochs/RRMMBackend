class ChangeDurationColumOnMeetings < ActiveRecord::Migration[7.0]
  def change
    change_column :meetings, :duration, :integer, null: false, default: 60
  end
end
