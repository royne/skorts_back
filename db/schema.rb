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

ActiveRecord::Schema.define(version: 2020_09_19_062303) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_escort_profiles", id: false, force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "escort_profile_id"
    t.index ["category_id"], name: "index_categories_escort_profiles_on_category_id"
    t.index ["escort_profile_id"], name: "index_categories_escort_profiles_on_escort_profile_id"
  end

  create_table "escort_profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "profile_photo"
    t.integer "city", default: 0
    t.text "description"
    t.jsonb "photos", default: []
    t.integer "price"
    t.string "schedule"
    t.integer "stars"
    t.boolean "verified", default: false
    t.integer "sex"
    t.integer "age"
    t.boolean "subscription", default: false
    t.bigint "user_id"
    t.bigint "type_subscription_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type_subscription_id"], name: "index_escort_profiles_on_type_subscription_id"
    t.index ["user_id"], name: "index_escort_profiles_on_user_id"
  end

  create_table "escort_profiles_locations", id: false, force: :cascade do |t|
    t.bigint "location_id"
    t.bigint "escort_profile_id"
    t.index ["escort_profile_id"], name: "index_escort_profiles_locations_on_escort_profile_id"
    t.index ["location_id"], name: "index_escort_profiles_locations_on_location_id"
  end

  create_table "escort_profiles_services", id: false, force: :cascade do |t|
    t.bigint "service_id", null: false
    t.bigint "escort_profile_id"
    t.bigint "services_id"
    t.index ["escort_profile_id"], name: "index_escort_profiles_services_on_escort_profile_id"
    t.index ["services_id"], name: "index_escort_profiles_services_on_services_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_subscriptions", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "categories_escort_profiles", "categories"
  add_foreign_key "categories_escort_profiles", "escort_profiles"
  add_foreign_key "escort_profiles", "type_subscriptions"
  add_foreign_key "escort_profiles", "users"
  add_foreign_key "escort_profiles_locations", "escort_profiles"
  add_foreign_key "escort_profiles_locations", "locations"
  add_foreign_key "escort_profiles_services", "escort_profiles"
  add_foreign_key "escort_profiles_services", "services", column: "services_id"
end
