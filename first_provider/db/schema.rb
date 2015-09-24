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

ActiveRecord::Schema.define(version: 20150917233447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_keys", force: :cascade do |t|
    t.string   "secret_token"
    t.boolean  "enable"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "sub_category_id"
    t.integer  "brand_id"
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.integer  "stock"
    t.integer  "minimum_stock"
    t.float    "price"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.boolean  "has_especification"
  end

  add_index "products", ["brand_id"], name: "index_products_on_brand_id", using: :btree
  add_index "products", ["sub_category_id"], name: "index_products_on_sub_category_id", using: :btree

  create_table "specifications", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "memory_size"
    t.string   "processor"
    t.string   "hard_disk"
    t.string   "ram"
    t.string   "os"
    t.string   "antivirus"
    t.string   "socket"
    t.string   "form_factor"
    t.string   "screen_size"
    t.string   "zoom_level"
    t.string   "increase"
    t.string   "type"
    t.string   "capacity"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "specifications", ["product_id"], name: "index_specifications_on_product_id", using: :btree

  create_table "sub_categories", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "code"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "sub_categories", ["category_id"], name: "index_sub_categories_on_category_id", using: :btree

  add_foreign_key "products", "brands"
  add_foreign_key "products", "sub_categories"
  add_foreign_key "specifications", "products"
  add_foreign_key "sub_categories", "categories"
end
