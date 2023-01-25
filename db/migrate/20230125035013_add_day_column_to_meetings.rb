class AddDayColumnToMeetings < ActiveRecord::Migration[7.0]
  def change
    add_column :meetings, :day, :integer, null: false, default: 0
  end
end
