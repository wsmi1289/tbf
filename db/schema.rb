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

ActiveRecord::Schema.define(version: 2019_08_08_044313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beds", force: :cascade do |t|
    t.bigint "field_id"
    t.bigint "planting_id"
    t.decimal "percent_used", precision: 5, scale: 2
    t.index ["field_id"], name: "index_beds_on_field_id"
    t.index ["planting_id"], name: "index_beds_on_planting_id"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "comments", force: :cascade do |t|
    t.string "name"
    t.text "body"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "crops", force: :cascade do |t|
    t.text "name"
    t.boolean "transplanted"
    t.decimal "row_spacing", precision: 5, scale: 2
    t.decimal "plant_spacing", precision: 5, scale: 2
    t.bigint "family_id"
    t.index ["family_id"], name: "index_crops_on_family_id"
  end

  create_table "families", force: :cascade do |t|
    t.text "name"
    t.integer "nitrogen", default: 0, null: false
    t.integer "biomass", default: 0, null: false
    t.integer "weed_competition", default: 0, null: false
    t.integer "erosion", default: 0, null: false
    t.integer "root_structure", default: 0, null: false
    t.jsonb "preceding", default: {}, null: false
    t.jsonb "succeeding", default: {}, null: false
    t.jsonb "companions", default: {}, null: false
  end

  create_table "fields", force: :cascade do |t|
    t.string "name"
    t.integer "length"
    t.integer "width"
    t.integer "num_beds"
  end

  create_table "line_items", force: :cascade do |t|
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "cart_id"
    t.integer "quantity", default: 1
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    t.index ["product_id"], name: "index_line_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "cart_id"
    t.index ["cart_id"], name: "index_orders_on_cart_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "pages", force: :cascade do |t|
    t.text "slug", null: false
    t.text "name", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sidebar_status", default: 0
    t.integer "link_position", default: 0
  end

  create_table "plantings", force: :cascade do |t|
    t.date "seeded_at"
    t.date "transplanted_at"
    t.date "harvested_at"
    t.bigint "field_id"
    t.bigint "crop_id"
    t.decimal "num_beds", precision: 5, scale: 2
    t.integer "bed_width"
    t.bigint "year_id"
    t.index ["crop_id"], name: "index_plantings_on_crop_id"
    t.index ["field_id"], name: "index_plantings_on_field_id"
    t.index ["year_id"], name: "index_plantings_on_year_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.integer "title_position", default: 0
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.decimal "price", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
    t.boolean "in_stock", default: true
    t.string "image"
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "side_bar_contents", force: :cascade do |t|
    t.text "content"
    t.text "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "page_id"
    t.string "title"
    t.string "image"
    t.index ["page_id"], name: "index_side_bar_contents_on_page_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.integer "role", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "years", force: :cascade do |t|
    t.date "start"
    t.date "end"
    t.integer "current", default: 2019
  end

  add_foreign_key "beds", "fields"
  add_foreign_key "beds", "plantings"
  add_foreign_key "crops", "families"
  add_foreign_key "line_items", "products"
  add_foreign_key "plantings", "crops"
  add_foreign_key "plantings", "fields"
  add_foreign_key "plantings", "years"
end
