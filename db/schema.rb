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

ActiveRecord::Schema.define(version: 2020_04_08_104949) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "mytransaction_id"
    t.index ["mytransaction_id"], name: "index_groups_on_mytransaction_id"
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "mytransactions", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "group_id"
    t.index ["group_id"], name: "index_mytransactions_on_group_id"
    t.index ["user_id"], name: "index_mytransactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "gravatar_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "password_digest"
    t.string "remember_token"
  end

  add_foreign_key "groups", "mytransactions"
  add_foreign_key "groups", "users"
  add_foreign_key "mytransactions", "groups"
  add_foreign_key "mytransactions", "users"
end
