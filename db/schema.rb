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

ActiveRecord::Schema.define(version: 20140507010532) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "first_name",      limit: 25
    t.string   "last_name",       limit: 50
    t.string   "email",                       default: ""
    t.string   "address",         limit: 100
    t.date     "birthday"
    t.integer  "customer_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers_products", id: false, force: true do |t|
    t.integer "customer_id"
    t.integer "product_id"
  end

  add_index "customers_products", ["customer_id", "product_id"], name: "index_customers_products_on_customer_id_and_product_id", using: :btree

  create_table "line_items", force: true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "line_items", ["order_id", "product_id"], name: "index_line_items_on_order_id_and_product_id", using: :btree

  create_table "orders", force: true do |t|
    t.string   "name",         limit: 25
    t.integer  "order_number"
    t.datetime "order_date"
    t.decimal  "sum"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id", using: :btree
  add_index "orders", ["order_number"], name: "index_orders_on_order_number", using: :btree

  create_table "products", force: true do |t|
    t.string   "name",            limit: 50
    t.integer  "product_serial"
    t.decimal  "price"
    t.decimal  "discount"
    t.integer  "unite"
    t.text     "product_content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
    t.integer  "category_id"
    t.string   "image_path"
  end

  add_index "products", ["order_id"], name: "index_products_on_order_id", using: :btree

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "users", force: true do |t|
    t.string   "username",   limit: 25
    t.string   "first_name", limit: 40
    t.string   "last_name"
    t.string   "email",                 default: "", null: false
    t.string   "password",   limit: 40
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
