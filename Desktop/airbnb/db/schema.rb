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

ActiveRecord::Schema.define(version: 20180429141348) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.string   "uid"
    t.string   "token"
    t.string   "provider"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authentications_on_user_id", using: :btree
  end

  create_table "listings", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "property_type"
    t.integer  "room_number"
    t.integer  "bed_number"
    t.integer  "guest_number"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.integer  "zipcode"
    t.string   "address"
    t.integer  "price"
    t.string   "description"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "verification",  default: false
    t.json     "property"
    t.index ["address"], name: "index_listings_on_address", using: :btree
    t.index ["bed_number"], name: "index_listings_on_bed_number", using: :btree
    t.index ["city"], name: "index_listings_on_city", using: :btree
    t.index ["country"], name: "index_listings_on_country", using: :btree
    t.index ["description"], name: "index_listings_on_description", using: :btree
    t.index ["guest_number"], name: "index_listings_on_guest_number", using: :btree
    t.index ["name"], name: "index_listings_on_name", using: :btree
    t.index ["price"], name: "index_listings_on_price", using: :btree
    t.index ["property_type"], name: "index_listings_on_property_type", using: :btree
    t.index ["room_number"], name: "index_listings_on_room_number", using: :btree
    t.index ["state"], name: "index_listings_on_state", using: :btree
    t.index ["user_id"], name: "index_listings_on_user_id", using: :btree
    t.index ["zipcode"], name: "index_listings_on_zipcode", using: :btree
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "listing_id"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "price"
    t.integer  "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_reservations_on_listing_id", using: :btree
    t.index ["user_id"], name: "index_reservations_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "email",                                      null: false
    t.string   "encrypted_password", limit: 128,             null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128,             null: false
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthday"
    t.integer  "role",                           default: 0
    t.json     "image"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["remember_token"], name: "index_users_on_remember_token", using: :btree
  end

  add_foreign_key "authentications", "users"
end
