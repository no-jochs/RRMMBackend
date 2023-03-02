class AddTypeColumnToMeetings < ActiveRecord::Migration[7.0]
  def up
    add_column :meetings, :type, :string
    Meeting.where(type: nil).update_all(type: 'InPersonMeeting')
    change_column_null :meetings, :type, false
  end

  def down
    remove_column :meetings, :type
  end
end
