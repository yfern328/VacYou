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

ActiveRecord::Schema.define(version: 20170710151541) do

  create_table "rentals", force: :cascade do |t|
    t.integer "user_id"
    t.integer "vacuum_id"
    t.integer "rental_duration"
    t.integer "rental_condition"
    t.string "rental_description"
    t.boolean "is_returned", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id"
    t.integer "vacuum_id"
    t.string "emoji_rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "vacuum_id"
    t.boolean "is_purchased", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "styles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.boolean "is_admin", default: false
    t.string "password_digest"
    t.integer "wallet", default: 500
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vacuums", force: :cascade do |t|
    t.string "name"
    t.integer "rental_price"
    t.integer "purchase_price"
    t.integer "rental_stock"
    t.integer "purchase_stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
