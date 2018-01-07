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

ActiveRecord::Schema.define(version: 20180105132217) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer "apartment_number"
    t.integer "building_number"
    t.string "street"
    t.string "area"
    t.boolean "saved", default: false
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_addresses_on_client_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auctions", force: :cascade do |t|
    t.date "bid_deadline"
    t.string "status"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_auctions_on_order_id"
  end

  create_table "bids", force: :cascade do |t|
    t.decimal "price"
    t.bigint "courier_id"
    t.bigint "auction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "refused", default: false
    t.index ["auction_id"], name: "index_bids_on_auction_id"
    t.index ["courier_id"], name: "index_bids_on_courier_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "img"
    t.string "phone"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.date "confirmed_at"
  end

  create_table "couriers", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "img"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  create_table "deliveries", force: :cascade do |t|
    t.integer "rating"
    t.text "review"
    t.string "status"
    t.bigint "order_id"
    t.bigint "courier_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["courier_id"], name: "index_deliveries_on_courier_id"
    t.index ["order_id"], name: "index_deliveries_on_order_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.text "body"
    t.string "user_type"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_type", "user_id"], name: "index_notifications_on_user_type_and_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "category"
    t.decimal "weight"
    t.string "dimensions"
    t.date "delivery_date"
    t.bigint "client_id"
    t.string "billing_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "pickup_address_id"
    t.bigint "drop_off_address_id"
    t.index ["client_id"], name: "index_orders_on_client_id"
    t.index ["drop_off_address_id"], name: "index_orders_on_drop_off_address_id"
    t.index ["pickup_address_id"], name: "index_orders_on_pickup_address_id"
  end

  add_foreign_key "addresses", "clients"
  add_foreign_key "auctions", "orders"
  add_foreign_key "bids", "auctions"
  add_foreign_key "bids", "couriers"
  add_foreign_key "deliveries", "couriers"
  add_foreign_key "deliveries", "orders"
  add_foreign_key "orders", "addresses", column: "drop_off_address_id"
  add_foreign_key "orders", "addresses", column: "pickup_address_id"
  add_foreign_key "orders", "clients"
end
