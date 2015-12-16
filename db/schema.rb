# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151214172957) do

  create_table "banneds", force: :cascade do |t|
    t.string   "name"
    t.string   "protected_camper"
    t.string   "camper"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "campers", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "campers_camps", id: false, force: :cascade do |t|
    t.integer "camp_id",   null: false
    t.integer "camper_id", null: false
    t.string  "status"
  end

  add_index "campers_camps", ["camp_id", "camper_id"], name: "index_campers_camps_on_camp_id_and_camper_id"
  add_index "campers_camps", ["camper_id", "camp_id"], name: "index_campers_camps_on_camper_id_and_camp_id"

  create_table "campers_users", id: false, force: :cascade do |t|
    t.integer "camper_id"
    t.integer "user_id"
  end

  add_index "campers_users", ["camper_id", "user_id"], name: "index_campers_users_on_camper_id_and_user_id"

  create_table "camps", force: :cascade do |t|
    t.string   "name"
    t.string   "theme"
    t.string   "category"
    t.float    "price"
    t.integer  "min_age"
    t.integer  "max_age"
    t.integer  "reg_limit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "am"
    t.string   "weeks"
    t.integer  "enrolled"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer  "camp_id"
    t.integer  "week"
    t.integer  "reg_limit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

# Could not dump table "users" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

end
