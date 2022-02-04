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

ActiveRecord::Schema.define(version: 2022_01_28_200308) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.date "birthdate"
    t.string "identification_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "funds", force: :cascade do |t|
    t.string "name"
    t.date "creation_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "investment_redemption_transactions", force: :cascade do |t|
    t.date "date"
    t.float "value"
    t.bigint "fund_id", null: false
    t.bigint "client_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_investment_redemption_transactions_on_client_id"
    t.index ["date"], name: "index_investment_redemption_transactions_on_date"
    t.index ["fund_id"], name: "index_investment_redemption_transactions_on_fund_id"
  end

  add_foreign_key "investment_redemption_transactions", "clients"
  add_foreign_key "investment_redemption_transactions", "funds"
end
