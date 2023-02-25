class AddIndexOnLocationIdColumnForMeetings < ActiveRecord::Migration[7.0]
  def change
    add_index :meetings, :location_id
  end
end
