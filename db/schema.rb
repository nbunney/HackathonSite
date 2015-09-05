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

ActiveRecord::Schema.define(version: 20150905080234) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name",                           null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.text     "description",       default: "", null: false
    t.string   "contact",                        null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name",                           null: false
    t.date     "date"
    t.text     "description"
    t.integer  "event_type",         default: 0, null: false
    t.integer  "status",             default: 0, null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "slug",                           null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "location_id"
  end

  add_index "events", ["location_id"], name: "index_events_on_location_id", using: :btree
  add_index "events", ["slug"], name: "index_events_on_slug", unique: true, using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "locations", force: :cascade do |t|
    t.float    "latitude",                 null: false
    t.float    "longitude",                null: false
    t.string   "address",                  null: false
    t.string   "sub_address", default: "", null: false
    t.string   "name",                     null: false
    t.text     "info",        default: "", null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "participants", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "team_id"
    t.integer  "event_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "participants", ["event_id"], name: "index_participants_on_event_id", using: :btree
  add_index "participants", ["team_id"], name: "index_participants_on_team_id", using: :btree
  add_index "participants", ["user_id"], name: "index_participants_on_user_id", using: :btree

  create_table "sponsorship_tiers", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "price",                             null: false
    t.string   "name",                              null: false
    t.string   "color",      limit: 6
    t.text     "details",              default: "", null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "sponsorship_tiers", ["event_id"], name: "index_sponsorship_tiers_on_event_id", using: :btree

  create_table "sponsorships", force: :cascade do |t|
    t.integer  "sponsorship_tier_id", null: false
    t.integer  "company_id",          null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "sponsorships", ["company_id"], name: "index_sponsorships_on_company_id", using: :btree
  add_index "sponsorships", ["sponsorship_tier_id"], name: "index_sponsorships_on_sponsorship_tier_id", using: :btree

  create_table "team_invites", force: :cascade do |t|
    t.integer  "team_id",                          null: false
    t.string   "email"
    t.string   "acceptance_token",                 null: false
    t.integer  "user_id"
    t.boolean  "accepted",         default: false, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "team_invites", ["team_id"], name: "index_team_invites_on_team_id", using: :btree
  add_index "team_invites", ["user_id"], name: "index_team_invites_on_user_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "event_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "teams", ["event_id"], name: "index_teams_on_event_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.text     "about"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "email",                                  null: false
    t.string   "encrypted_password",                     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "real_name",                              null: false
    t.boolean  "admin",                  default: false, null: false
    t.string   "slug",                                   null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree

  add_foreign_key "events", "locations"
  add_foreign_key "participants", "events"
  add_foreign_key "participants", "teams"
  add_foreign_key "participants", "users"
  add_foreign_key "sponsorship_tiers", "events"
  add_foreign_key "sponsorships", "companies"
  add_foreign_key "sponsorships", "sponsorship_tiers"
  add_foreign_key "team_invites", "teams"
  add_foreign_key "team_invites", "users"
  add_foreign_key "teams", "events"
end
