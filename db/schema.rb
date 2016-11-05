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

ActiveRecord::Schema.define(version: 20161105135825) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bootsy_image_galleries", force: :cascade do |t|
    t.integer  "bootsy_resource_id"
    t.string   "bootsy_resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bootsy_images", force: :cascade do |t|
    t.string   "image_file"
    t.integer  "image_gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "campaigns", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.date     "current_date",   default: '2016-08-23'
    t.integer  "game_master_id"
  end

  create_table "campaigns_players", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "campaign_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "campaigns_players", ["campaign_id"], name: "index_campaigns_players_on_campaign_id", using: :btree
  add_index "campaigns_players", ["user_id", "campaign_id"], name: "index_campaigns_players_on_user_id_and_campaign_id", unique: true, using: :btree
  add_index "campaigns_players", ["user_id"], name: "index_campaigns_players_on_user_id", using: :btree

  create_table "characters", force: :cascade do |t|
    t.string   "name"
    t.text     "public_description"
    t.integer  "campaign_id"
    t.string   "type"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "player_id"
  end

  add_index "characters", ["campaign_id"], name: "index_characters_on_campaign_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.text     "public_description"
    t.text     "private_description"
    t.integer  "campaign_id"
    t.integer  "location_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "locations", ["campaign_id"], name: "index_locations_on_campaign_id", using: :btree
  add_index "locations", ["location_id"], name: "index_locations_on_location_id", using: :btree

  create_table "log_entries", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.date     "ic_date"
    t.date     "oc_date"
    t.integer  "campaign_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "log_entries", ["campaign_id"], name: "index_log_entries_on_campaign_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "campaigns_players", "campaigns"
  add_foreign_key "campaigns_players", "users"
  add_foreign_key "characters", "campaigns"
  add_foreign_key "locations", "campaigns"
  add_foreign_key "locations", "locations"
  add_foreign_key "log_entries", "campaigns"
end
