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

ActiveRecord::Schema.define(version: 20140626071046) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "break_histories", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cancel_histories", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "destroy_histories", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "histories", force: true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.integer  "amount"
    t.text     "detail"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.datetime "start_date"
  end

  create_table "items", force: true do |t|
    t.string   "name"
    t.text     "attachments"
    t.integer  "lending_period"
    t.integer  "category"
    t.text     "place"
    t.integer  "amount"
    t.boolean  "trashed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  create_table "lend_histories", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lose_histories", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.string   "subject"
    t.text     "contents"
    t.string   "from"
    t.boolean  "read_flag"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservations", force: true do |t|
    t.datetime "start_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "history_id"
  end

  create_table "reserve_histories", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restore_histories", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "return_histories", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "uid"
    t.boolean  "admin_flag"
    t.integer  "category"
    t.boolean  "lendable"
    t.string   "e_mail"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password", default: "", null: false
  end

end
