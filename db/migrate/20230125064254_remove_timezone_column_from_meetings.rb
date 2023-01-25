class RemoveTimezoneColumnFromMeetings < ActiveRecord::Migration[7.0]
  def change
    remove_column :meetings, :timezone, :string, default: 'UTC', null: false
  end
end
