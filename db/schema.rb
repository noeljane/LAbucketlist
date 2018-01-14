# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180114065313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "image_url"
    t.string "note"
    t.date "date_completed"
    t.string "category"
    t.string "neighborhood"
    t.string "rating"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "link"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "body"
    t.bigint "activity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["activity_id"], name: "index_comments_on_activity_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_digest"
  end

  add_foreign_key "activities", "users"
  add_foreign_key "comments", "activities"
  add_foreign_key "comments", "users"
end
