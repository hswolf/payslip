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

ActiveRecord::Schema.define(version: 20170911100839) do

  create_table "nations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_nations_on_code"
  end

  create_table "tax_ranges", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "start_range", null: false
    t.string "end_range", default: "", null: false
    t.string "plus", default: "0"
    t.string "rate", default: "0"
    t.bigint "tax_rate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_range"], name: "index_tax_ranges_on_end_range"
    t.index ["start_range"], name: "index_tax_ranges_on_start_range"
    t.index ["tax_rate_id"], name: "index_tax_ranges_on_tax_rate_id"
  end

  create_table "tax_rates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.string "formula", default: "default"
    t.bigint "nation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_date"], name: "index_tax_rates_on_end_date"
    t.index ["nation_id"], name: "index_tax_rates_on_nation_id"
    t.index ["start_date"], name: "index_tax_rates_on_start_date"
  end

  add_foreign_key "tax_ranges", "tax_rates"
  add_foreign_key "tax_rates", "nations"
end
