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

ActiveRecord::Schema.define(version: 2023_01_19_071215) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "auctionproducts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "auction_id"
    t.string "name", default: "", null: false
    t.integer "minproductbid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 1, null: false
    t.index ["auction_id", "name"], name: "index_auctionproducts_on_auction_id_and_name", unique: true
    t.index ["auction_id"], name: "index_auctionproducts_on_auction_id"
    t.index ["user_id"], name: "index_auctionproducts_on_user_id"
  end

  create_table "auctions", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "starttime", null: false
    t.datetime "endtime", null: false
    t.integer "minbids", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "status", default: 1, null: false
    t.index ["name"], name: "index_auctions_on_name", unique: true
    t.index ["user_id"], name: "index_auctions_on_user_id"
  end

  create_table "autobids", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "auctionproduct_id"
    t.integer "amount", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auctionproduct_id"], name: "index_autobids_on_auctionproduct_id"
    t.index ["user_id"], name: "index_autobids_on_user_id"
  end

  create_table "bids", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "auctionproduct_id"
    t.integer "bidamount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auctionproduct_id"], name: "index_bids_on_auctionproduct_id"
    t.index ["user_id"], name: "index_bids_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "auctionproduct_id"
    t.text "feedback", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auctionproduct_id"], name: "index_reviews_on_auctionproduct_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0, null: false
    t.string "name", default: "", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wins", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "bid_id"
    t.bigint "auctionproduct_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auctionproduct_id"], name: "index_wins_on_auctionproduct_id"
    t.index ["bid_id"], name: "index_wins_on_bid_id"
    t.index ["user_id"], name: "index_wins_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "auctionproducts", "auctions"
  add_foreign_key "auctionproducts", "users"
  add_foreign_key "auctions", "users"
  add_foreign_key "autobids", "auctionproducts"
  add_foreign_key "autobids", "users"
  add_foreign_key "bids", "auctionproducts"
  add_foreign_key "bids", "users"
  add_foreign_key "reviews", "auctionproducts"
  add_foreign_key "reviews", "users"
  add_foreign_key "wins", "auctionproducts"
  add_foreign_key "wins", "bids"
  add_foreign_key "wins", "users"
end
