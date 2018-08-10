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

ActiveRecord::Schema.define(version: 2018_08_05_043008) do

  create_table "addresses", force: :cascade do |t|
    t.string "description"
    t.string "cep"
    t.string "address"
    t.string "city"
    t.string "uf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "function"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
