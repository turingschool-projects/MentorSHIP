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

ActiveRecord::Schema.define(version: 20170202180315) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cohorts", force: :cascade do |t|
    t.integer  "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mentor_timezones", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mentors", force: :cascade do |t|
    t.string   "avatar"
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "slack_username"
    t.string   "location"
    t.string   "bio"
    t.string   "expertise"
    t.string   "company"
    t.string   "position"
    t.datetime "last_active"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "mentor_timezone_id"
    t.index ["mentor_timezone_id"], name: "index_mentors_on_mentor_timezone_id", using: :btree
  end

  create_table "students", force: :cascade do |t|
    t.string   "avatar"
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "slack_username"
    t.string   "bio"
    t.datetime "last_active"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "students_mentors", force: :cascade do |t|
    t.integer  "students_id"
    t.integer  "mentors_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["mentors_id"], name: "index_students_mentors_on_mentors_id", using: :btree
    t.index ["students_id"], name: "index_students_mentors_on_students_id", using: :btree
  end

  add_foreign_key "mentors", "mentor_timezones"
  add_foreign_key "students_mentors", "mentors", column: "mentors_id"
  add_foreign_key "students_mentors", "students", column: "students_id"
end
