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

ActiveRecord::Schema[7.0].define(version: 2023_11_03_143003) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blood_cell_descriptions", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "parameter"
    t.boolean "glossary_only", default: true
  end

  create_table "hemigrams", force: :cascade do |t|
    t.string "parameter"
    t.string "value"
    t.string "unit"
    t.integer "user_id"
    t.datetime "date", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "short"
    t.string "chart_unit"
    t.string "chart_value"
  end

  create_table "hemigrams_chart_settings", force: :cascade do |t|
    t.integer "parameter_ids", default: [], array: true
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_hemigrams_chart_settings_on_user_id"
  end

  create_table "hemigrams_parameter_associations", force: :cascade do |t|
    t.bigint "hemigram_id", null: false
    t.bigint "parameter_metadata_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hemigram_id"], name: "index_hemigrams_parameter_associations_on_hemigram_id"
    t.index ["parameter_metadata_id"], name: "index_hemigrams_parameter_associations_on_parameter_metadata_id"
  end

  create_table "hemigrams_parameter_metadata", force: :cascade do |t|
    t.string "parameter_name"
    t.string "abbreviations", default: [], array: true
    t.string "chart_unit"
    t.float "upper_limit"
    t.float "lower_limit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parameter_name"], name: "index_hemigrams_parameter_metadata_on_parameter_name", unique: true
  end

  create_table "links", force: :cascade do |t|
    t.string "name", null: false
    t.string "url"
    t.bigint "blood_cell_description_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "text_generator"
    t.index ["blood_cell_description_id"], name: "index_links_on_blood_cell_description_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.string "confirmation_token"
    t.datetime "confirmed_at", precision: nil
    t.datetime "confirmation_sent_at", precision: nil
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "hemigrams_chart_settings", "users", on_delete: :cascade
  add_foreign_key "hemigrams_parameter_associations", "hemigrams", name: "hemigram_fk"
  add_foreign_key "hemigrams_parameter_associations", "hemigrams_parameter_metadata", column: "parameter_metadata_id", name: "parameter_metadata_fk"
  add_foreign_key "links", "blood_cell_descriptions"
end
