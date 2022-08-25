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

ActiveRecord::Schema[7.0].define(version: 2022_08_24_083236) do
  create_table "agents", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "region_id"
    t.string "last_name"
    t.string "first_name"
    t.string "middle_name"
    t.string "position"
    t.date "hired"
    t.string "email"
    t.string "contact_no"
    t.string "status"
    t.boolean "licensed"
    t.boolean "active"
    t.string "user_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_agents_on_region_id"
  end

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

  create_table "cooperative_franchises", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "cooperative_id"
    t.string "franchisee_type"
    t.bigint "franchisee_id"
    t.bigint "product_id"
    t.string "status"
    t.string "creator_type"
    t.bigint "creator_id"
    t.date "expiry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cooperative_id"], name: "index_cooperative_franchises_on_cooperative_id"
    t.index ["creator_type", "creator_id"], name: "index_cooperative_franchises_on_creator"
    t.index ["franchisee_type", "franchisee_id"], name: "index_cooperative_franchises_on_franchisee"
    t.index ["product_id"], name: "index_cooperative_franchises_on_product_id"
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

  create_table "departments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "division_id", null: false
    t.string "name"
    t.string "short_name"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["division_id"], name: "index_departments_on_division_id"
  end

  create_table "divisions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "short_name"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "middle_name"
    t.string "employee_no"
    t.bigint "division_id", null: false
    t.bigint "department_id", null: false
    t.string "position"
    t.string "user_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "encrypted_password"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["department_id"], name: "index_employees_on_department_id"
    t.index ["division_id"], name: "index_employees_on_division_id"
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
  add_foreign_key "departments", "divisions"
  add_foreign_key "employees", "departments"
  add_foreign_key "employees", "divisions"
  add_foreign_key "municipalities", "provinces"
  add_foreign_key "municipalities", "regions"
  add_foreign_key "product_categories", "product_lines"
  add_foreign_key "products", "product_categories"
  add_foreign_key "products", "product_lines"
  add_foreign_key "provinces", "regions"
end
