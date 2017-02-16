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

ActiveRecord::Schema.define(version: 20170216134656) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mentors", force: :cascade do |t|
    t.integer  "timezone_id"
    t.string   "expertise"
    t.string   "location"
    t.string   "company"
    t.string   "position"
    t.integer  "user_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "profile_complete", default: false
    t.index ["timezone_id"], name: "index_mentors_on_timezone_id", using: :btree
    t.index ["user_id"], name: "index_mentors_on_user_id", using: :btree
  end

  create_table "students", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_students_on_user_id", using: :btree
  end

  create_table "timezones", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "phone"
    t.string   "bio"
    t.datetime "last_active"
    t.string   "token"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "census_id"
  end

  add_foreign_key "mentors", "timezones"
  add_foreign_key "mentors", "users"
  add_foreign_key "students", "users"
end
