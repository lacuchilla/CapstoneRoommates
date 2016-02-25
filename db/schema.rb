# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160225172344) do

  create_table "bills", force: :cascade do |t|
    t.string   "name"
    t.integer  "total_amount"
    t.integer  "number_of_people_responsible"
    t.string   "names_of_people_responsible"
    t.boolean  "paid"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.datetime "due_date"
    t.integer  "parent_key"
    t.integer  "child_key"
  end

  create_table "households", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "move_in_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "shares", force: :cascade do |t|
    t.integer  "bill_id"
    t.datetime "due_date"
    t.integer  "share_amount"
    t.boolean  "paid"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "uid"
    t.string   "provider"
    t.string   "avatar_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image_url"
  end

end
