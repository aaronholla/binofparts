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

ActiveRecord::Schema.define(version: 20140313033518) do

  create_table "events", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "key"
    t.string   "name"
    t.string   "short_name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "official"
  end

  create_table "inventories", force: true do |t|
    t.integer  "part_id"
    t.integer  "event_id"
    t.integer  "qty"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parts", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "number"
    t.integer  "qty"
    t.string   "category"
    t.string   "picture"
    t.string   "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requests", force: true do |t|
    t.integer  "part_id"
    t.integer  "qty"
    t.integer  "event_id"
    t.integer  "team_id"
    t.boolean  "accepted",    default: false
    t.integer  "accepted_by"
    t.datetime "accepted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "requests", ["event_id"], name: "index_requests_on_event_id"
  add_index "requests", ["part_id"], name: "index_requests_on_part_id"
  add_index "requests", ["team_id"], name: "index_requests_on_team_id"

  create_table "teams", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_number"
    t.string   "nickname"
    t.string   "name"
    t.string   "key"
    t.string   "website"
    t.string   "locality"
    t.string   "region"
    t.string   "country_name"
    t.string   "location"
    t.text     "events",       limit: 255, default: "{}"
  end

  add_index "teams", ["team_number"], name: "index_teams_on_team_number", unique: true

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "team_number_id"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "invitations_count"
    t.string   "authentication_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
