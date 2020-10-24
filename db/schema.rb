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

ActiveRecord::Schema.define(version: 20200922022849) do

  create_table "accesses", force: :cascade do |t|
    t.integer "shop_id"
    t.string "line"
    t.string "station"
    t.integer "walk_time"
    t.integer "bus_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_accesses_on_shop_id"
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

  create_table "fees", force: :cascade do |t|
    t.integer "shop_id"
    t.string "plan"
    t.string "pay"
    t.boolean "apply"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_fees_on_shop_id"
  end

  create_table "freelance_occupations", force: :cascade do |t|
    t.integer "freelance_id"
    t.integer "occupation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["freelance_id"], name: "index_freelance_occupations_on_freelance_id"
    t.index ["occupation_id"], name: "index_freelance_occupations_on_occupation_id"
  end

  create_table "freelance_shop_statuses", force: :cascade do |t|
    t.integer "freelance_id"
    t.integer "shop_id"
    t.boolean "sign_up"
    t.boolean "interviewed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["freelance_id"], name: "index_freelance_shop_statuses_on_freelance_id"
    t.index ["shop_id"], name: "index_freelance_shop_statuses_on_shop_id"
  end

  create_table "freelances", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.string "line_id"
    t.string "password_digest"
    t.string "remember_digest"
    t.string "post_code"
    t.string "address_prefecture"
    t.string "address_city"
    t.string "address_branch"
    t.string "address_building"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "occupations", force: :cascade do |t|
    t.integer "shop_id"
    t.integer "freelance_id"
    t.string "name"
    t.string "ja"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["freelance_id"], name: "index_occupations_on_freelance_id"
    t.index ["shop_id"], name: "index_occupations_on_shop_id"
  end

  create_table "options", force: :cascade do |t|
    t.integer "shop_id"
    t.boolean "salon_facility"
    t.boolean "for_practitioner"
    t.boolean "for_guest"
    t.boolean "paid_option"
    t.boolean "standard"
    t.string "name"
    t.string "pay"
    t.string "specific"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_options_on_shop_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "line_id"
    t.string "phone_number"
    t.string "password_digest"
    t.string "remember_digest"
    t.string "post_code"
    t.string "address_prefecture"
    t.string "address_city"
    t.string "address_branch"
    t.string "address_building"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "freelance_id"
    t.integer "shop_id"
    t.datetime "preferred_date1"
    t.datetime "preferred_date2"
    t.datetime "preferred_date3"
    t.datetime "fixed_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["freelance_id"], name: "index_reservations_on_freelance_id"
    t.index ["shop_id"], name: "index_reservations_on_shop_id"
  end

  create_table "shop_occupations", force: :cascade do |t|
    t.integer "shop_id"
    t.integer "occupation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["occupation_id"], name: "index_shop_occupations_on_occupation_id"
    t.index ["shop_id"], name: "index_shop_occupations_on_shop_id"
  end

  create_table "shop_options", force: :cascade do |t|
    t.integer "shop_id"
    t.integer "option_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_id"], name: "index_shop_options_on_option_id"
    t.index ["shop_id"], name: "index_shop_options_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.integer "owner_id"
    t.string "name"
    t.string "email"
    t.string "line_id"
    t.string "phone_number"
    t.boolean "display"
    t.string "note"
    t.string "post_code"
    t.string "address_prefecture"
    t.string "address_city"
    t.string "address_town"
    t.string "address_branch"
    t.string "address_building"
    t.time "mon_start"
    t.time "mon_finish"
    t.boolean "mon_off"
    t.time "tue_start"
    t.time "tue_finish"
    t.boolean "tue_off"
    t.time "wed_start"
    t.time "wed_finish"
    t.boolean "wed_off"
    t.time "thu_start"
    t.time "thu_finish"
    t.boolean "thu_off"
    t.time "fri_start"
    t.time "fri_finish"
    t.boolean "fri_off"
    t.time "sat_start"
    t.time "sat_finish"
    t.boolean "sat_off"
    t.time "sun_start"
    t.time "sun_finish"
    t.boolean "sun_off"
    t.string "other_holiday"
    t.text "appeal"
    t.text "memo"
    t.boolean "introduction"
    t.integer "customer_sex"
    t.integer "worker_sex"
    t.boolean "share"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_shops_on_owner_id"
  end

  create_table "stations", force: :cascade do |t|
    t.string "area"
    t.string "line"
    t.string "name"
  end

end
