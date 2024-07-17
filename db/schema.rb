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

ActiveRecord::Schema[7.1].define(version: 2024_07_16_205808) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "merchants", id: :string, force: :cascade do |t|
    t.boolean "deny", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", id: false, force: :cascade do |t|
    t.string "transaction_id"
    t.datetime "transaction_date", null: false
    t.integer "transaction_amount", null: false
    t.string "card_number", null: false
    t.string "device_id"
    t.boolean "chargebacked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "processed", default: false
    t.string "user_id"
    t.string "merchant_id"
    t.boolean "approved", default: false
    t.index ["merchant_id"], name: "index_transactions_on_merchant_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", id: :string, force: :cascade do |t|
    t.boolean "deny", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
