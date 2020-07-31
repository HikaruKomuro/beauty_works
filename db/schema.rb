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

ActiveRecord::Schema.define(version: 20200603080650) do

  create_table "accesses", force: :cascade do |t|
    t.integer "shops_id"
    t.string "line"
    t.string "station"
    t.integer "walk_time"
    t.integer "bus_time"
    t.integer "bus_stop"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shops_id"], name: "index_accesses_on_shops_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "line_id"
    t.string "password_digest"
    t.string "remember_digest"
    t.string "post_code"
    t.string "address_prefecture"
    t.string "address_city"
    t.string "address_branch"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "choices", force: :cascade do |t|
    t.integer "freelances_id"
    t.integer "shop_id"
    t.string "status"
    t.string "reservation：datetime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["freelances_id"], name: "index_choices_on_freelances_id"
  end

  create_table "freelances", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "line_id"
    t.string "password_digest"
    t.string "remember_digest"
    t.string "post_code"
    t.string "address_prefecture"
    t.string "address_city"
    t.string "address_branch"
    t.string "building"
    t.string "skill"
    t.integer "belongs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "line_id"
    t.string "tel"
    t.string "password_digest"
    t.string "remember_digest"
    t.string "post_code"
    t.string "address_prefecture"
    t.string "address_city"
    t.string "address_branch"
    t.string "building"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", force: :cascade do |t|
    t.integer "owners_id"
    t.string "name"
    t.string "tel"
    t.boolean "display"
    t.string "post_code"
    t.string "address_prefecture"
    t.string "address_city"
    t.string "address_branch"
    t.string "building"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owners_id"], name: "index_shops_on_owners_id"
  end

end
