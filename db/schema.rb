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

ActiveRecord::Schema[7.0].define(version: 2023_02_06_221733) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name", null: false
    t.text "notes"
    t.decimal "latitude", precision: 15, scale: 12
    t.decimal "longitude", precision: 15, scale: 12
    t.string "country", null: false
    t.string "state_providence"
    t.string "postal_code"
    t.string "slug", null: false
    t.integer "venue_type", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "timezone_identifier", null: false
    t.integer "status", default: 0, null: false
    t.string "street_address_1"
    t.string "street_address_2"
    t.string "city"
    t.index ["slug"], name: "index_locations_on_slug", unique: true
  end

  create_table "meetings", force: :cascade do |t|
    t.string "name", null: false
    t.date "start_date", default: -> { "CURRENT_DATE" }, null: false
    t.integer "duration", default: 60, null: false
    t.text "notes"
    t.string "conference_link"
    t.json "group_resources", default: {}, null: false
    t.integer "location_id", null: false
    t.integer "language", default: 0, null: false
    t.string "slug", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "day", default: 0, null: false
    t.boolean "visible", default: true
    t.integer "status", default: 0, null: false
    t.integer "start_time_hour", default: 12, null: false
    t.integer "start_time_minute", default: 0, null: false
    t.index ["slug"], name: "index_meetings_on_slug", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.json "authorizations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
