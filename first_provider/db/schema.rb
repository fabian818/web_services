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

ActiveRecord::Schema.define(version: 20150917161314) do

  create_table "brands", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "sub_category_id", limit: 4
    t.integer  "brand_id",        limit: 4
    t.string   "code",            limit: 255
    t.string   "name",            limit: 255
    t.string   "description",     limit: 255
    t.integer  "stock",           limit: 4
    t.integer  "minimum_stock",   limit: 4
    t.float    "price",           limit: 24
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "products", ["brand_id"], name: "index_products_on_brand_id", using: :btree
  add_index "products", ["sub_category_id"], name: "index_products_on_sub_category_id", using: :btree

  create_table "specifications", force: :cascade do |t|
    t.integer  "product_id",  limit: 4
    t.string   "memory_size", limit: 255
    t.string   "processor",   limit: 255
    t.string   "hard_disk",   limit: 255
    t.string   "ram",         limit: 255
    t.string   "os",          limit: 255
    t.string   "antivirus",   limit: 255
    t.string   "socket",      limit: 255
    t.string   "form_factor", limit: 255
    t.string   "screen_size", limit: 255
    t.string   "zoom_level",  limit: 255
    t.string   "increase",    limit: 255
    t.string   "type",        limit: 255
    t.string   "capacity",    limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "specifications", ["product_id"], name: "index_specifications_on_product_id", using: :btree

  create_table "sub_categories", force: :cascade do |t|
    t.integer  "category_id", limit: 4
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "sub_categories", ["category_id"], name: "index_sub_categories_on_category_id", using: :btree

  add_foreign_key "products", "brands"
  add_foreign_key "products", "sub_categories"
  add_foreign_key "specifications", "products"
  add_foreign_key "sub_categories", "categories"
end
