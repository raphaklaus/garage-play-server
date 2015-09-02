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

ActiveRecord::Schema.define(version: 20150902021328) do

  create_table "band_requests", force: true do |t|
    t.string   "band_id",    limit: 36, null: false
    t.integer  "user_id"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "band_requests", ["band_id"], name: "index_band_requests_on_band_id", using: :btree
  add_index "band_requests", ["user_id"], name: "index_band_requests_on_user_id", using: :btree

  create_table "bands", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "city"
    t.string   "genre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bands", ["user_id"], name: "index_bands_on_user_id", using: :btree

  create_table "bands_users", force: true do |t|
    t.string  "band_id", limit: 36, null: false
    t.integer "user_id"
  end

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "reminder_id"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["reminder_id"], name: "index_comments_on_reminder_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "compromises", force: true do |t|
    t.string   "title"
    t.string   "location"
    t.datetime "datehour"
    t.string   "description"
    t.integer  "periodicity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "email_notification",               default: false
    t.boolean  "sms_notification",                 default: false
    t.boolean  "facebook_notification",            default: false
    t.string   "band_id",               limit: 36,                 null: false
  end

  add_index "compromises", ["band_id"], name: "index_compromises_on_band_id", using: :btree

  create_table "contacts", force: true do |t|
    t.integer  "user_id"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["user_id"], name: "index_contacts_on_user_id", using: :btree

  create_table "notifications", force: true do |t|
    t.integer  "compromise_id"
    t.integer  "notification_type"
    t.datetime "send_date"
    t.boolean  "sent",              default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifications", ["compromise_id"], name: "index_notifications_on_compromise_id", using: :btree

  create_table "reminders", force: true do |t|
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "band_id",    limit: 36, null: false
  end

  add_index "reminders", ["band_id"], name: "index_reminders_on_band_id", using: :btree
  add_index "reminders", ["user_id"], name: "index_reminders_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "email"
    t.string   "phone_number", limit: 16
    t.string   "social_id"
    t.integer  "social_type"
  end

end
