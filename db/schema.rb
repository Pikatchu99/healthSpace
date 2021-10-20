# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_20_083805) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "pharmacy_id"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pharmacy_id"], name: "index_comments_on_pharmacy_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "pharmacy_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pharmacy_id"], name: "index_favorites_on_pharmacy_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "pharmacies", force: :cascade do |t|
    t.string "name"
    t.string "contact"
    t.string "whatsapp"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.string "city"
    t.string "quartier"
    t.index ["user_id"], name: "index_pharmacies_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "available"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "pharmacy_id"
    t.text "first_image"
    t.text "second_image"
    t.index ["pharmacy_id"], name: "index_products_on_pharmacy_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "lundi"
    t.string "mardi"
    t.string "mercredi"
    t.string "jeudi"
    t.string "vendredi"
    t.string "samedi"
    t.string "dimanche"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "pharmacy_id"
    t.index ["pharmacy_id"], name: "index_schedules_on_pharmacy_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "city"
    t.string "quartier"
    t.string "user_role", default: "Patient"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "pharmacies"
  add_foreign_key "favorites", "pharmacies"
  add_foreign_key "favorites", "users"
  add_foreign_key "pharmacies", "users"
  add_foreign_key "products", "pharmacies"
  add_foreign_key "schedules", "pharmacies"
end
