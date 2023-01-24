# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_01_17_020229) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: :cascade do |t|
    t.string "name", null: false
    t.text "notes"
    t.decimal "latitude"
    t.decimal "longitude"
    t.string "formatted_address"
    t.string "country", null: false
    t.string "state_providence"
    t.string "postal_code"
    t.string "url_slug", null: false
    t.integer "venue_type", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meetings", force: :cascade do |t|
    t.string "name", null: false
    t.date "start_date", default: -> { "CURRENT_DATE" }, null: false
    t.time "start_time", null: false
    t.integer "duration", default: 3600, null: false
    t.string "timezone", default: "UTC", null: false
    t.text "notes"
    t.string "conference_link"
    t.json "group_resources", default: {}, null: false
    t.integer "location_id", null: false
    t.integer "language", default: 0, null: false
    t.string "url_slug", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.json "authorizations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
