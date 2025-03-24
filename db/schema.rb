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

ActiveRecord::Schema[8.0].define(version: 2016_03_17_180509) do
  create_table "bills", force: :cascade do |t|
    t.string "name"
    t.integer "total_amount_cents"
    t.boolean "paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "due_date"
    t.integer "household_id"
    t.string "payment_type"
    t.integer "bill_status"
  end

  create_table "households", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "move_in_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shares", force: :cascade do |t|
    t.integer "bill_id"
    t.datetime "due_date"
    t.integer "share_amount_cents"
    t.boolean "paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "payment_type"
    t.datetime "date_received"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "uid"
    t.string "provider"
    t.string "avatar_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.integer "household_id"
    t.datetime "move_in_date"
    t.string "name"
  end
end
