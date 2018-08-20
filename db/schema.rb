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

ActiveRecord::Schema.define(version: 2018_08_20_175040) do

  create_table "addresses", force: :cascade do |t|
    t.string "description"
    t.string "cep"
    t.string "address"
    t.string "city"
    t.integer "uf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "cars", force: :cascade do |t|
    t.string "plate"
    t.string "mark"
    t.string "modelType"
    t.integer "functionary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["functionary_id"], name: "index_cars_on_functionary_id"
  end

  create_table "displacements", force: :cascade do |t|
    t.integer "car_id"
    t.integer "functionary_id"
    t.date "dateDay"
    t.integer "osNumber"
    t.integer "osProject"
    t.time "startHour"
    t.time "endHour"
    t.integer "addressSrc_id"
    t.integer "addressDst_id"
    t.integer "kmStart"
    t.integer "kmEnd"
    t.integer "kmCount"
    t.text "annotation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressDst_id"], name: "index_displacements_on_addressDst_id"
    t.index ["addressSrc_id"], name: "index_displacements_on_addressSrc_id"
    t.index ["car_id"], name: "index_displacements_on_car_id"
    t.index ["functionary_id"], name: "index_displacements_on_functionary_id"
  end

  create_table "functionaries", force: :cascade do |t|
    t.string "matriculation"
    t.string "name"
    t.integer "function"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "leader"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
