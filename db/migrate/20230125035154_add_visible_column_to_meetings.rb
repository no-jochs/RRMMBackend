class AddVisibleColumnToMeetings < ActiveRecord::Migration[7.0]
  def change
    add_column :meetings, :visible, :boolean, default: true
  end
end
