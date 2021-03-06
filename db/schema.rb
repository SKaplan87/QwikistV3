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

ActiveRecord::Schema.define(version: 20170518160445) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agreements", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "client_id"
    t.integer  "fee"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "active",     default: true
    t.string   "playlist"
    t.index ["client_id"], name: "index_agreements_on_client_id", using: :btree
    t.index ["user_id"], name: "index_agreements_on_user_id", using: :btree
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "email"
    t.string   "img"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_id"
    t.boolean  "active",     default: true
    t.index ["user_id"], name: "index_clients_on_user_id", using: :btree
  end

  create_table "gyms", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "bio"
    t.integer  "fee"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_id"
    t.boolean  "active",     default: true
    t.index ["user_id"], name: "index_gyms_on_user_id", using: :btree
  end

  create_table "notes", force: :cascade do |t|
    t.integer  "agreement_id"
    t.date     "date"
    t.text     "content"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["agreement_id"], name: "index_notes_on_agreement_id", using: :btree
  end

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
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "workouts", force: :cascade do |t|
    t.integer  "agreement_id"
    t.integer  "gym_id"
    t.date     "date"
    t.time     "time"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.index ["agreement_id"], name: "index_workouts_on_agreement_id", using: :btree
    t.index ["gym_id"], name: "index_workouts_on_gym_id", using: :btree
    t.index ["user_id"], name: "index_workouts_on_user_id", using: :btree
  end

  add_foreign_key "agreements", "clients"
  add_foreign_key "agreements", "users"
  add_foreign_key "clients", "users"
  add_foreign_key "gyms", "users"
  add_foreign_key "notes", "agreements"
  add_foreign_key "workouts", "agreements"
  add_foreign_key "workouts", "gyms"
  add_foreign_key "workouts", "users"
end
