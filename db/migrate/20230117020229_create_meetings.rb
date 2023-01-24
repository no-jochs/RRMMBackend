class CreateMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :meetings do |t|
      t.string :name, null: false, length: { minimum: 1, maximum: 255 }
      t.date :start_date, null: false, default: -> { 'CURRENT_DATE' }
      t.time :start_time, null: false
      t.integer :duration, null: false, default: 60 * 60
      t.string :timezone, null: false, default: 'UTC'
      t.text :notes
      t.string :conference_link
      t.json :group_resources, null: false, default: {}
      t.integer :location_id, null: false
      t.integer :language, null: false, default: 0
      t.string :url_slug, null: false

      t.timestamps
    end
  end
end
