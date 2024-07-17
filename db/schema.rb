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

ActiveRecord::Schema[7.1].define(version: 2024_07_17_153426) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "transaction_histories", force: :cascade do |t|
    t.bigint "transaction_id"
    t.string "external_transaction_id"
    t.integer "amount", null: false
    t.string "card_number", null: false
    t.datetime "external_date", null: false
    t.integer "user_id"
    t.integer "merchant_id"
    t.integer "device_id"
    t.boolean "chargebacked"
    t.boolean "approved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transaction_id"], name: "index_transaction_histories_on_transaction_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "external_id"
    t.datetime "external_date", null: false
    t.integer "amount", null: false
    t.string "card_number", null: false
    t.string "device_id"
    t.bigint "user_id"
    t.bigint "merchant_id"
    t.boolean "chargebacked", default: false
    t.boolean "approved", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["merchant_id"], name: "index_transactions_on_merchant_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  add_foreign_key "transaction_histories", "transactions"
end
