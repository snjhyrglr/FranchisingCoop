# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_08_23_010627) do
  create_table "barangays", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "region_id", null: false
    t.bigint "province_id", null: false
    t.bigint "municipality_id", null: false
    t.string "name"
    t.string "psgc_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["municipality_id"], name: "index_barangays_on_municipality_id"
    t.index ["province_id"], name: "index_barangays_on_province_id"
    t.index ["region_id"], name: "index_barangays_on_region_id"
  end

  create_table "cooperatives", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "region_id"
    t.bigint "province_id"
    t.bigint "municipality_id"
    t.bigint "barangay_id"
    t.string "address"
    t.string "category"
    t.string "coop_type"
    t.string "status"
    t.string "asset_size"
    t.string "registration_no"
    t.decimal "total_asset", precision: 20, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["barangay_id"], name: "index_cooperatives_on_barangay_id"
    t.index ["municipality_id"], name: "index_cooperatives_on_municipality_id"
    t.index ["province_id"], name: "index_cooperatives_on_province_id"
    t.index ["region_id"], name: "index_cooperatives_on_region_id"
  end

  create_table "municipalities", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "region_id", null: false
    t.bigint "province_id", null: false
    t.string "name"
    t.string "psgc_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["province_id"], name: "index_municipalities_on_province_id"
    t.index ["region_id"], name: "index_municipalities_on_region_id"
  end

  create_table "product_categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "product_line_id", null: false
    t.string "name"
    t.string "code"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_line_id"], name: "index_product_categories_on_product_line_id"
  end

  create_table "product_lines", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "product_line_id", null: false
    t.bigint "product_category_id", null: false
    t.string "name"
    t.string "code"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
    t.index ["product_line_id"], name: "index_products_on_product_line_id"
  end

  create_table "provinces", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "region_id", null: false
    t.string "name"
    t.string "psgc_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_provinces_on_region_id"
  end

  create_table "regions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "psgc_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "barangays", "municipalities"
  add_foreign_key "barangays", "provinces"
  add_foreign_key "barangays", "regions"
  add_foreign_key "municipalities", "provinces"
  add_foreign_key "municipalities", "regions"
  add_foreign_key "product_categories", "product_lines"
  add_foreign_key "products", "product_categories"
  add_foreign_key "products", "product_lines"
  add_foreign_key "provinces", "regions"
end
