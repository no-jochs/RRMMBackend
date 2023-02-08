class RemoveDayColumnFromMeetings < ActiveRecord::Migration[7.0]
  def up
    remove_column :meetings, :day
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
